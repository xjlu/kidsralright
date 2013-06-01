class ClassroomsController < ApplicationController
  respond_to :json

  def index
    @school = School.find(params[:id])
    respond_with @school.classrooms
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