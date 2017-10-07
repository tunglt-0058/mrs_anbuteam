class FavoriteMoviesController < ApplicationController
  before_action :find_user, only: :index
  before_action :find_movie, only: [:create, :destroy]
  before_action :find_favorite_movie, only: :destroy

  def index
    @movies = @user.load_favorite_movies
  end

  def create
    unless current_user.favorited_movie? @movie
      @favorite = @movie.favorite_movies.new user: current_user
      @favorite.save
    end
  end

  def destroy
    if @favorite.destroy
      flash[:success] = t "favorite.destroy_success"
    else
      flash[:danger] = t "favorite.destroy_fail"
    end
  end

  private
  def find_user
    @user = User.find_by id: params[:user_id]
    unless @user
      flash[:danger] = t "not_found.user"
      redirect_to not_found_index_path
    end
  end

  def find_movie
    @movie = Movie.find_by id: params[:movie_id]
    unless @movie
      flash[:danger] = t "not_found.movie"
      redirect_to not_found_index_path
    end
  end

  def find_favorite_movie
    @favorite = current_user.favorite_movies.find_by id: params[:id]
    unless @favorite
      flash[:danger] = t "not_found.favorite"
      redirect_to not_found_index_path
    end
  end
end
