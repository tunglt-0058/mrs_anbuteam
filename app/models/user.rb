class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, length: {maximum: 255},
    format: {with: Devise.email_regexp}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {within: Devise.password_length}, allow_nil: true
  validates :name, presence: true, length: {maximum: 50}
end
