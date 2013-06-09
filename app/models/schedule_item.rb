class ScheduleItem < ActiveRecord::Base
  belongs_to :schedule
  validates :schedule_id, :start_time, :end_time, :title, :presence => true
end
