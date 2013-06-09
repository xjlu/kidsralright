class Schedule < ActiveRecord::Base
  strip_attributes :only => [:name]
  has_many :schedule_items
end
