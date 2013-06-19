class TimelineController < ApplicationController
  def index
    @selected = 'timeline'
    render :template => 'timeline/index'
  end
end