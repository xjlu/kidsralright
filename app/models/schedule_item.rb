class ScheduleItem < ActiveRecord::Base
  belongs_to :schedule
  validates :schedule_id, :start_time, :end_time, :title, :presence => true

  default_scope order(:start_time)

  validate :start_time_earlier_than_end_time

  def start_time_earlier_than_end_time
    if start_time > end_time
      errors.add(:start_time, "can't be later than end time")
    end
  end
end
