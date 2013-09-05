class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter :authenticate_user!


  def current_account
  end

  def current_school
  end

  def home_page
    render :template => "home_page"
  end
end
