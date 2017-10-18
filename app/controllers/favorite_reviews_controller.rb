class FavoriteReviewsController < ApplicationController
  before_action :find_user, only: :index
  before_action :find_review, only: [:create, :destroy]
  before_action :find_favorite_review, only: :destroy

  def index
    @reviews = @user.load_favorite_reviews
  end

  def create
    unless current_user.favorited_review? @review
      @favorite = @review.favorite_reviews.new user: current_user
      @favorite.save
    end
  end

  def destroy
    if @favorite.destroy
      flash[:success] = t "favorite.review.destroy_success"
    else
      flash[:danger] = t "favorite.review.destroy_fail"
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

  def find_review
    @review = Review.find_by id: params[:review_id]
    unless @review
      flash[:danger] = t "not_found.review"
      redirect_to not_found_index_path
    end
  end

  def find_favorite_review
    @favorite = current_user.favorite_reviews.find_by id: params[:id]
    unless @favorite
      flash[:danger] = t "not_found.favorite_review"
      redirect_to not_found_index_path
    end
  end
end
