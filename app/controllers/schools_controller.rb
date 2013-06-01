class SchoolsController < ApplicationController
  respond_to :json

  def index
  end

  # params: :name, :address
  def create
    @school  = School.create(
      :name => params[:name],
      :address => params[:address]
    )

    respond_with @school
  end

  def update
    @school = School.find(params[:id])
    @school.update_attributes(
      :name => params[:name],
      :address => params[:address]
    )

    respond_with @school
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy

    respond_with @school
  end
end