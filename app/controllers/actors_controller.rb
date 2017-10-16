class ActorsController < ApplicationController
  before_action :load_genres, only: [:index, :show]
  before_action :find_actor, only: [:index, :show]
  def index
    @actors = Actor.paginate(page: params[:page],
      per_page: Settings.page_actor_size).order(id: :desc)
  end

  def show
    if current_user
     @favorite = current_user.favorite_actors.find_by actor: @actor
    end
  end

  private

  def load_genres
    @genres = Genre.all
  end

  def find_actor
    @actor = Actor.find_by id: params[:id]
  end
end
