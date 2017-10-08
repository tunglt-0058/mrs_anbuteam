class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, :through => :movie_genres, :dependent => :destroy
  has_many :actors, :through => :movies
end
