class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, :omniauth_providers => [:facebook]

  validates :email, presence: true, length: {maximum: 255},
    format: {with: Devise.email_regexp}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {within: Devise.password_length}, allow_nil: true
  validates :name, presence: true, length: {maximum: 50}

  has_many :comments
  has_many :reviews
  has_many :favorite_actors
  has_many :actors, :through => :favorite_actors, :dependent => :destroy
  has_many :favorite_movies
  has_many :movies, :through => :favorite_movies, :dependent => :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  scope :load_know_users, -> (user_ids){where.not(id: user_ids)
    .order id: :desc}

  mount_uploader :avatar, AvatarUploader

  def load_favorite_movies
    Movie.where(id: favorite_movies.pluck(:movie_id)).order id: :desc
  end

  def favorited_movie? movie
    self.favorite_movies.find_by(movie: movie).present? ? true : false
  end

  def just_followed
    following.order(created_at: :desc).limit 10
  end

  def know_users
    user_ids = following.ids
    user_ids.push self.id
    User.load_know_users user_ids
  end

  def load_favorite_actors
    Actor.where(id: favorite_actors.pluck(:actor_id)).order id: :desc
  end

  def favorited_actor? actor
    self.favorite_actors.find_by(actor: actor).present? ? true : false
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.avatar = auth.info.image
    end
  end


  def followed? user
    following.include? user
  end

  def follow other_user
    following << other_user
    active_relationships.last
  end

  def unfollow other_user
    following.delete other_user
  end

  def user_relationship user
    active_relationships.find_by followed_id: user.id
  end

  def current_user? user
    self == user
  end
end
