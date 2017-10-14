class Actor < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}
  validates :date_of_birth, presence: true

  has_many :movie_actors
  has_many :movies, :through => :movie_actors, :dependent => :destroy
  has_many :favorite_actors
  has_many :users, :through => :favorite_actors, :dependent => :destroy
  has_many :images, :dependent => :destroy
end
