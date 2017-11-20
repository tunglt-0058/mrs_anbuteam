class SuggestMoviesController < ApplicationController
  before_action :find_movie, only: :create

  def create
    suggest_movies = SuggestMovie
      .create_suggest_movie(suggest_movies_params, @movie, current_user.id)

    if suggest_movies
      users = []
      suggest_movies.each do |suggest_movie|
        users.push User.find suggest_movie.receiver_id
      end
      @supports = Supports::SuggestMovies.new movie: @movie,
        suggest_movies: suggest_movies, users: users
      respond_to do |f|
        partial = "suggest_movies/_modal_suggest_movie_result"
        f.html{render partial, layout: false, locals: {supports: @supports}}
      end
    else
      flash[:danger] = t "movies.suggest_movie.fail"
    end
  end

  private
  def suggest_movies_params
    params.require(:suggest_movie).permit :sender_id, :movie_id, :content,
      receiver_id: []
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
    unless @movie
      flash[:danger] = t "not_found.movie"
      redirect_to not_found_index_path
    end
  end
end
