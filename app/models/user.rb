class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

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
end
