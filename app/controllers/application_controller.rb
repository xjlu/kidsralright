class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!, except: [:flash_page]

  def current_account
  end

  def current_school
  end

  def flash_page
    render template: "flash_page"
  end

  def home_page
    render template: "home_page"
  end
end
