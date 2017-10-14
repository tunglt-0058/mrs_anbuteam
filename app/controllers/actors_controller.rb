class ActorsController < ApplicationController
  before_action :load_genres, only: [:index, :show]
  before_action :find_actor

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new actor_params
    respond_to do |format|
      if @actor.save
        format.html { redirect_to @actor, notice: "Actor was successfully created." }
        format.json { render :show, status: :created, location: @actor }
      else
        format.html { render :new }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @actors = Actor.paginate(page: params[:page], per_page: 6).order(id: :desc)
  end

  def show
    if current_user
     @favorite = current_user.favorite_actors.find_by actor: @actor
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to @actor, notice: "Actor was successfully update." }
        format.json { render :show, status: :created, location: @actor }
      else
        format.html { render :edit }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @actor.destroy
    respond_to do |format|
      format.html { redirect_to actors_path, notice: "Actor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def actor_params
    params.require(:actor).permit :name, :date_of_birth, :avatar
  end

  def load_genres
    @genres = Genre.all
  end

  def find_actor
    @actor = Actor.find_by id: params[:id]
  end
end
