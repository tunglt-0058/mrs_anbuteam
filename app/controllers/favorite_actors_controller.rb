class FavoriteActorsController < ApplicationController
  before_action :find_user, only: :index
  before_action :find_actor, only: [:create, :destroy]
  before_action :find_favorite_actor, only: :destroy

  def index
    @actors = @user.load_favorite_actors
  end

  def create
    unless current_user.favorited_actor? @actor
      @favorite = @actor.favorite_actors.new user: current_user
      @favorite.save
    end
  end

  def destroy
    if @favorite.destroy
      flash[:success] = t "favorite.actor.destroy_success"
    else
      flash[:danger] = t "favorite.actor.destroy_fail"
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

  def find_actor
    @actor = Actor.find_by id: params[:actor_id]
    unless @actor
      flash[:danger] = t "not_found.actor"
      redirect_to not_found_index_path
    end
  end

  def find_favorite_actor
    @favorite = current_user.favorite_actors.find_by id: params[:id]
    byebug
    unless @favorite
      flash[:danger] = t "not_found.favorite_actor"
      redirect_to not_found_index_path
    end
  end
end
