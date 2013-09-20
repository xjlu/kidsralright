class UsersController < ApplicationController
  def index
    @users = User.all

    render :json => @users
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.disable

    respond_with @user
  end
end