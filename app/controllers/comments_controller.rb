class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@comment = Comment.create comment_params.merge({user_id: current_user.id, place_id: params[:place_id]})
		redirect_to place_path(params[:place_id])
	end

	private
	def comment_params
		return params.require(:comment).permit(:message, :rating)
	end
end