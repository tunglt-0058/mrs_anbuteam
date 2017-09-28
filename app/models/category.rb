class Category < ApplicationRecord
  has_many :movie_categories
  has_many :movies, :through => :movie_categories, :dependent => :destroy
end
