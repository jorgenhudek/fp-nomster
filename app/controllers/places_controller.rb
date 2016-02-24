class PlacesController < ApplicationController
  def index
    @places = Place.page(params[:page]).per(3)
  end

  def new
  	@place = Place.new
  end

  def create
  	Place.create(place_params)
  	redirect_to root_path
  end

  private
  def place_params
  	return params.require(:place).permit(:name, :description, :address)
  end
end