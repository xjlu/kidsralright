class ScheduleItemsController < ApplicationController
  respond_to :json

  def index
    @items = ScheduleItem.where(:schedule_id => params[:schedule_id])

    respond_with @items
  end
end