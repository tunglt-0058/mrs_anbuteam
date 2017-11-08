class GenresController < ApplicationController
  before_action :find_genre, only: :show
  before_action :load_genres, :load_messages, only: [:index, :show]

  def index
    if params[:genre_type] == "genre_actor"
      @actors = Actor.paginate(page: params[:page],
        per_page: Settings.page_actor_size).order(id: :desc)
    else
      @movies = Movie.paginate(page: params[:page],
        per_page: Settings.page_movie_size).order(id: :desc)
    end
  end

  def show
    if params[:genre_type] == "genre_actor"
      @actors = @genre.actors.paginate(page: params[:page],
        per_page: Settings.page_actor_size).order(id: :desc)
    else
      @movies = @genre.movies.paginate(page: params[:page],
        per_page: Settings.page_movie_size).order(id: :desc)
    end
  end

  private
  def find_genre
    @genre = Genre.find_by id: params[:id]
  end

  def load_genres
    @genres = Genre.all
  end
end
