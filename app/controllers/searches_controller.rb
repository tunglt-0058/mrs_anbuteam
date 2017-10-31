class SearchesController < ApplicationController
  before_action :find_result, only: :index
  before_action :load_popular_movies, only: [:index, :new]
  before_action :load_messages, only: [:index, :new]

  def index
    respond_to do |format|
      format.html
      format.js do
        render json: {results: @results, status: 200}
      end
    end
  end

  def new
    @genres = Genre.all
    @movies = if params[:genre_ids]
      Movie.load_movie_with_genres params[:genre_ids]
    else
      Movie.all
    end
    @movies = @movies.paginate(page: params[:page],
      per_page: Settings.page_movie_size).order(id: :desc)
  end

  private
  def find_result
    if params[:search].blank?
      redirect_to request.referer
    else
      @results = Hash.new
      Settings.search_objects.each do |obj|
        @results.store(obj.tableize.to_s,
          obj.constantize.search(params[:search]) || Array.new)
      end
    end
  end
end
