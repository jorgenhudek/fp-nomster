class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_comments = @user.comments
  end
end