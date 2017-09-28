class Movie < ApplicationRecord
  has_many :videos, :dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :movie_categories, :dependent => :destroy
  has_many :categories, :through => :movie_categories
  has_many :movie_genres
  has_many :genres, :through => :movie_genres, :dependent => :destroy
  has_many :movie_producers
  has_many :producers, :through => :movie_producers, :dependent => :destroy
  has_many :movie_actors
  has_many :actors, :through => :movie_actors, :dependent => :destroy
  has_many :favorite_movies
  has_many :users, :through => :favorite_movies, :dependent => :destroy
  has_many :images, :dependent => :destroy
end
