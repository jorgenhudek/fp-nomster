class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_places = @user.places.page(params[:place_page]).per(3)
    @user_comments = @user.comments.page(params[:comment_page]).per(3)
  end
end