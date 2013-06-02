class TimelineController < ApplicationController
  def index
    render :template => 'timeline/index'
  end
end