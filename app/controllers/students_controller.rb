class StudentsController < ApplicationController
  respond_to :json

  def index
  end

  def create
    @student = Student.create(
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :date_of_birth => params[:date_of_birth]
    )

    respond_with @student
  end

  def show
    @student = Student.find(params[:id])

    respond_with @student
  end

  def update
    @student = Student.find(params[:id])

    @student.update_attributes(
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :date_of_birth => params[:date_of_birth]
    )

    respond_with @student
  end

  def destroy
    @student = Student.find(params[:id])
    @student.disable

    respond_with @student
  end
end