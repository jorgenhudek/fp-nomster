class PlacesController < ApplicationController
  def index
    @places = Place.page(params[:page]).per(3)
  end

  def new
  	@place = Place.new
  end
end