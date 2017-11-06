class Movie < ApplicationRecord
  has_many :reviews, :dependent => :destroy
  has_many :movie_categories, :dependent => :destroy
  has_many :categories, :through => :movie_categories
  has_many :movie_genres
  has_many :genres, :through => :movie_genres, :dependent => :destroy
  has_many :movie_actors
  has_many :actors, :through => :movie_actors, :dependent => :destroy
  has_many :favorite_movies
  has_many :users, :through => :favorite_movies, :dependent => :destroy

  ["rate_five", "rate_four", "rate_three", "rate_two", "rate_one"]
    .each do |rate|
      define_method rate do
        reviews.where point: Settings.rate.send(rate)
      end
  end

  def avarage_rate
    if(reviews.size > 0)
      (total_rate / reviews.size).to_f
    else
      total_rate = 0
    end
  end

  class << self
    def top_movies
      all.order(point: :desc).limit Settings.load_top_movies
    end

    def recent_movies
      all.order(point: :desc).limit Settings.load_recent_movies
    end

    def search data
      data = data.downcase
      Movie.where "lower(name) LIKE ?", "%#{data}%"
    end

    def load_movie_with_genres genre_ids
      movie_ids = MovieGenre.where(genre_id: genre_ids).group(:movie_id)
        .having("COUNT(movie_id) >= ?", genre_ids.size).pluck :movie_id
      Movie.where id: movie_ids
    end
  end

  private
  def total_rate
    sum_rate = 0;
    ["rate_five", "rate_four", "rate_three", "rate_two", "rate_one"]
      .each do |rate|
      sum_rate += self.send(rate).size * Settings.rate.send(rate)
    end
    sum_rate
  end
end
