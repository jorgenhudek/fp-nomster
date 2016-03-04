class PhotosController < ApplicationController
	before_action :authenticate_user!

	def create
    @comment = Comment.new # Allows for full functionality if the render below happens
		place_id = params[:place_id]
		@place = Place.find(place_id)
		return render text: "This action is not allowed", status: :forbidden if current_user.id != @place.user_id
		@photo = Photo.new photo_params.merge(place_id: place_id)
    if @photo.save
      redirect_to place_path(place_id)
    else
      render "places/show"
    end
	end

  # Takes care of an otherwise invalid route exposed by the render above
  def index
    return redirect_to place_path(params[:place_id])
  end

	private
	def photo_params
		return params.require(:photo).permit(:image, :caption)
	end
end