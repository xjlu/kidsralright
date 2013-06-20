class SchedulesController < ApplicationController

  respond_to :json

  def index
    @selected = 'schedules'

    # @schedules = Schedule.where(:classroom_id => params[:classroom_id])

    # all schedules for a school
    # school_id = params[:school_id]
    school_id = 1
    @schedules = Schedule.joins(:classroom).where('classrooms.school_id = ?', school_id)

    respond_to do |format|
      format.html
      format.json { render :json => @schedules }
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
    respond_with @schedule
  end
end