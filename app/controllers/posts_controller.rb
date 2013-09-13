class PostsController < ApplicationController

  def index
    render :json => Post.order('id DESC').all
  end

  def create
    p = Post.new
    p.message = params[:message]
    p.classroom = Classroom.find_by_name("dolphin") # for testing
    p.creator = User.first
    p.save

    render :json => p, :status => :created
  end

  def update
    p = Post.find(params[:id])
    p.message = params[:message]
    p.save

    render :json => p, :status => :ok
  end

  def destroy
    p = Post.find(params[:id])
    if p.destroy
      head :no_content, status: :ok
    else
      head :no_content, status: :unprocessed_entity
    end
  end

end