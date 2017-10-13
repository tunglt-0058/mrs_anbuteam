class ActivitiesController < ApplicationController
  before_action :authenticate_user!, :find_review, :find_activity

  def create
    @activity = @review.activities.build user: current_user unless @activity
    @activity.activity_type = if @activity.like? &&
      params[:activity_type] == :dislike
       :dislike
    elsif @activity.dislike? && params[:activity_type] == :like
      :like
    else
      params[:activity_type]
    end
    @activity.save
  end

  def destroy
    @activity.destroy if @activity
  end

  private
  def authenticate_user!
    unless current_user
      flash[:danger] = t "need_sign"
      redirect_to new_user_session_path
    end
  end

  def find_review
    @review = Review.find_by id: params[:review_id]
    unless @review
      flash[:danger] = t "not_found.review"
      redirect_to not_found_index_path
    end
  end

  def find_activity
    @activity = @review.activities.find_by user: current_user
  end
end
