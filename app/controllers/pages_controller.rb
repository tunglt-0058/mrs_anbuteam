class PagesController < ApplicationController
  before_action :load_data_static
  before_action :load_reviews, only: [:show]
  before_action :load_popular_movies, only: :show
  before_action :load_data, only: [:show]

  def show
    @reviews = Review.top_reviews.includes(:comments, :movie)
  end

  private
  def load_reviews
    @reviews = Review.all
  end

  def load_data
    @genres = Genre.all
    if params[:genre_type] == "genre_actor"
      @actors = Actor.paginate(page: params[:page],
        per_page: Settings.page_actor_size).order(id: :desc)
    else
      @movies = Movie.paginate(page: params[:page],
        per_page: Settings.page_movie_size).order(id: :desc)
    end
  end
end
