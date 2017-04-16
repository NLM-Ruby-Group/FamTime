class PlacesController < ApplicationController
  before_action :require_user, only: [:new,:create,:edit,:update]
  
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new place_params
    if @place.save
      redirect_to places_path
    else
      render 'new'
    end
  end

  def edit
    @place = Place.find(params[:id])
    @reviews = @place.reviews
  end

  def update
    @place = Place.find(params[:id])
    @reviews = @place.reviews
    if @place.update(place_params) 
      flash.now[:success] = "Event successfully update"
      render 'show'
    end
  end

  def show
    @place = Place.find(params[:id])
    @reviews = @place.reviews
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :opening_hours,:closing_hours, :rating,:remove_image, :description, {image:[]} )
  end
end
