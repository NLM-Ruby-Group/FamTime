class PlacesController < ApplicationController
  before_action :require_user, only: [:create,:edit,:update]
  
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
      flash.now[:failure] = @place.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
  end

  def show
    @place = Place.find(params[:id])
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :photo, :opening_hours, :rating)
  end
end
