class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @places = Place.page(params[:page]).per(3)
  end

  def new
  	@place = Place.new
  end

  def create
  	Place.create(place_creation_params.merge(user_id: current_user.id))
  	redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])  
  end

  private
  def place_creation_params
  	return params.require(:place).permit(:name, :description, :address)
  end
end