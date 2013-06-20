class Schedule < ActiveRecord::Base
  strip_attributes :only => [:name]
  has_many :schedule_items
  belongs_to :classroom

  after_initialize :set_default_values, :on => :create
  validate :start_date_earlier_than_end_date

  private ##### private #######

  def start_date_earlier_than_end_date
    if self.start_date > self.end_date
      errors.add(:start_date => "can't be later than end date")
    end
  end

  def set_default_values
    self.start_date = Date.today
    self.end_date = Date.today
  end
end
