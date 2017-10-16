class GenresController < ApplicationController
  before_action :find_genre, only: :show
  before_action :load_genres, only: [:index, :show]

  def index
    @movies = Movie.paginate(page: params[:page],
      per_page: Settings.page_movie_size).order(id: :desc)
  end

  def show
    @movies = @genre.movies.paginate(page: params[:page],
      per_page: Settings.page_movie_size).order(id: :desc)
  end

  private
  def find_genre
    @genre = Genre.find_by id: params[:id]
  end

  def load_genres
    @genres = Genre.all
  end
end
