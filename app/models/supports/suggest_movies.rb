class Supports::SuggestMovies
  def initialize arg
    @suggest_movies = arg
  end

  def load_movie
    @suggest_movies[:movie]
  end

  def load_suggest_movies
    @suggest_movies[:suggest_movies]
  end

  def load_users
    @suggest_movies[:users]
  end
end
