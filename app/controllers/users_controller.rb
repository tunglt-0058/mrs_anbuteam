class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user

  def show
    type = params[:type]
    if type == "favorite_movie"
      @movies = current_user.movies.paginate(page: params[:page], per_page: 6)
    elsif type == "favorite_actor"
      @actors = current_user.actors.paginate(page: params[:page], per_page: 6)
    else
    end
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    return if @user.present?
    flash[:danger] = t "user.edit.not_found"
    redirect_to root_path
  end
end
