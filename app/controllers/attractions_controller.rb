class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction), :notice => "Attraction was successfully updated."
    else
      render :edit
    end
  end

  def show
    @user = current_user
  end

  def index
    @user = current_user
    @attractions = Attraction.all
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_path, :notice => "Attraction was successfully destroyed."
  end

  private

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end
end
