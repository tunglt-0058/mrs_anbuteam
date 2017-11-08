class ActorsController < ApplicationController
  before_action :load_genres, only: :show
  before_action :find_actor, :load_messages

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
