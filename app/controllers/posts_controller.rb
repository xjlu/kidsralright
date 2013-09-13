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
    p = Post.find(:id)
    p.message = params[:message]
    p.save

    render :json => p, :status => :ok
  end

end