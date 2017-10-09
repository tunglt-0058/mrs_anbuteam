class MoviesController < ApplicationController
  before_action :find_movie, only: [:show]
  helper_method :sort_column, :sort_direction

  def index
    if params[:order_by] && params[:order_by] == "name" && !params[:commit]
      @movies = Movie.paginate(page: params[:page], per_page: 3).order(:name)
    elsif !params[:order_by] && !params[:commit]
      @movies = Movie.paginate(page: params[:page], per_page: 3).order(id: :desc)
    elsif params[:commit] == "Search"
      @movies = Movie.joins(:movie_genres).where(movie_genres: {genre_id: params[:genre_ids] }
        .having("count(genre_id) >= ?", params[:genre_ids].count)
        .group("movies.id").paginate(page: params[:page], per_page: 3).order(:id))
    else
      @movies = Movie.order("RANDOM()").first(5)
    end
  end

  def show
    if current_user
      @favorite = current_user.favorite_movies.find_by movie: @movie
    end
  end

  def new
    @movie = Movie.new
    @genres = Genre.all
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
       add_genres
       add_categories
        format.html { redirect_to @movie, notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }

      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        add_genres
        add_categories
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }

      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def find_movie
      @movie = Movie.find(params[:id])
      unless @movie
        flash[:danger] = t "not_found.movie"
        redirect_to not_found_index_path
      end
    end

    def movie_params
      params.require(:movie).permit(:name, :score, :ranked, :episodes, :status, :rating, :poster, :summary, :genre_ids => [], :category_ids => [])
    end

    def add_genres
      params[:movie][:genre_ids].each {|genre|
        count = MovieGenre.where("movie_id = ?", @movie.id).where("genre_id = ?", genre).count
        if count == 0 then MovieGenre.create(:movie_id => @movie.id, :genre_id => genre)
        end
      }
    end

    def add_categories
      if params[:movie][:category_ids]
        params[:movie][:category_ids].each do |c|
          if not @movie.categories.find(c)
            MovieCategory.create(:movie_id => @movie.id, :category_id => c)
          end
        end
      end
    end
end
