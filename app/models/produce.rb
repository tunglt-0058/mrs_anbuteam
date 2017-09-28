class Produce < ApplicationRecord
  has_many :movie_producers
  has_many :movies, :through => :movie_producers, :dependent => :destroy
end
