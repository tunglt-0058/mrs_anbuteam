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

  mount_uploader :avatar, AvatarUploader

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
end
