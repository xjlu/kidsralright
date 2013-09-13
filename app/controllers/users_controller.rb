class UsersController < ApplicationController
  def index
    @users = User.all

    render :json => @users
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    @user.disable

    respond_with @user
  end
end