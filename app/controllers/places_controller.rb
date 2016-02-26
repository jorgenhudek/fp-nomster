class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.page(params[:page]).per(3)
  end

  def new
  	@place = Place.new
  end

  def create
  	Place.create(place_params.merge(user_id: current_user.id))
  	redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
    render text: "You are not allowed to access this page", status: :forbidden if current_user.id != @place.user_id
  end

  def update
    @place = Place.find(params[:id])
    return render text: "This action is not allowed", status: :forbidden if current_user.id != @place.user_id
    @place.update_attributes(place_params.merge(user_id: current_user.id))
    redirect_to place_path(@place)
  end

  def destroy
    @place = Place.find(params[:id])
    return render text: "This action is not allowed", status: :forbidden if current_user.id != @place.user_id
    @place.destroy
    redirect_to root_path
  end

  private
  def place_params
  	return params.require(:place).permit(:name, :description, :address)
  end
end