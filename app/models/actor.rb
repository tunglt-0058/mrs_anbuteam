class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, :through => :movie_actors, :dependent => :destroy
  has_many :favorite_actors
  has_many :users, :through => :favorite_actors, :dependent => :destroy
  has_many :images, :dependent => :destroy
end
