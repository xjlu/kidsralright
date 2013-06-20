class ScheduleItem < ActiveRecord::Base

  strip_attributes :only => [:title, :description, :comments]

  default_scope order(:start_time)

  belongs_to :schedule
  validates :schedule_id, :start_time, :end_time, :title, :presence => true
  validate :start_time_earlier_than_end_time

  private

  def start_time_earlier_than_end_time
    if start_time > end_time
      errors.add(:start_time, "can't be later than end time")
    end
  end
end
