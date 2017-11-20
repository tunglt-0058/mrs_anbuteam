class MoviesController < ApplicationController
  before_action :find_movie, only: [:show]
  before_action :load_messages
  helper_method :sort_column, :sort_direction

  def show
    if current_user
      @favorite = current_user.favorite_movies.find_by movie: @movie
    end
    @suggest_movie = SuggestMovie.new
    @users = current_user.load_suggest_movie_to_users
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
    unless @movie
      flash[:danger] = t "not_found.movie"
      redirect_to not_found_index_path
    end
  end
end
