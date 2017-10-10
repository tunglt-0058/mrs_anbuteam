class CommentsController < ApplicationController
  before_action :find_review
  before_action :find_comment, only: [:edit, :update, :destroy]

  def index
    @comments = @review.main_comments
    comment_size = Settings.load_more_comment_size
    unless @comments.empty?
      comment_offset = params[:comment_offset] || (@comments.first.id + 1)
      @comments = @comments.where("id < ?", comment_offset)
        .limit comment_size
    end
    @last = @comments.size < comment_size ? true : false
  end

  def new
  end

  def create
    @comment = Comment.new comment_params
    @comment.review = @review
    @comment.user = current_user
    @success = @comment.save
  end

  def edit
  end

  def update
    @comment.update_attributes comment_params
  end

  def destroy
    @comment.destroy
    @comments = @review.main_comments
    comment_size = Settings.load_more_comment_size
    unless @comments.empty?
      comment_offset = params[:comment_offset] || (@comments.first.id + 1)
      @comments = @comments.where("id < ?", comment_offset)
        .limit comment_size
    end
    @last = @comments.size < comment_size ? true : false
  end

  private
  def comment_params
    params.require(:comment).permit :reply_id, :content, :parent_id
  end

  def find_review
    @review = Review.find_by id: params[:review_id]
    unless @review
      flash[:danger] = t "not_found.review"
      redirect_to not_found_index_path
    end
  end

  def find_comment
    @comment = Comment.find_by id: params[:id]
    unless @comment
      flash[:danger] = t "not_found.comment"
      redirect_to not_found_index_path
    end
  end
end
