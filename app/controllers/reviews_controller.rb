class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def show
    @top_reviews = Review.top_reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    respond_to do |format|
      if @review.save
        @movie = Movie.find(@review.movie_id)
        format.json { render json: @movie }
        format.js
      else
        format.json { render json: @review.errors.full_messages,
          status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.json { render json: @movie }
        format.js
      else
        format.json { render json: @review.errors.full_messages,
          status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @review.destroy
    redirect_to movie_path(@review.movie_id)
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private

  def find_review
    @review = Review.find(params[:id])
    unless @review
      flash[:danger] = t "not_found.review"
      redirect_to not_found_index_path
    end
  end

  def review_params
    params.require(:review).permit(:content, :user_id,
      :movie_id, :point)
  end
end
