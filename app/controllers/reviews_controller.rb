class ReviewsController < ApplicationController
  before_action :find_review

  def show
  end

  private
  def find_review
    @review = Review.find(params[:id])
    unless @review
      flash[:danger] = t "not_found.review"
      redirect_to not_found_index_path
    end
  end
end
