class PagesController < ApplicationController
  before_action :load_data_static
  before_action :load_reviews, only: [:show]
  before_action :load_popular_movies, only: :show
  before_action :load_data, only: [:show]

  def show
    if valid_page?
      render template: "pages/#{params[:page_temp]}"
    else
      render file: "public/404.html", status: :not_found
    end
    @reviews = Review.top_reviews.includes(:comments, :movie)
  end

  private
  def valid_page?
    File.exist? Pathname
      .new(Rails.root + "app/views/pages/#{params[:page_temp]}.html.erb")
  end

  def load_reviews
    @reviews = Review.all
  end

  def load_data
    @genres = Genre.all
    @movies = Movie.paginate(page: params[:page],
      per_page: Settings.page_movie_size).order(id: :desc)
  end
end
