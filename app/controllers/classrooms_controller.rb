class ClassroomsController < ApplicationController
  respond_to :json

  def index
    classroom_list = current_user.classrooms
    respond_with classroom_list
  end

  def create
    @classroom = Classroom.create(
      :name => params[:name])

    respond_with @classroom
  end

  def update
    @classroom = Classroom.find(params[:id])
    @classroom.update_attributes(:name => params[:name])

    respond_with @classroom
  end

  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy

    respond_with @classroom
  end
end