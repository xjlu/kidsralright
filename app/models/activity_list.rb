class ActivityList < ActiveRecord::Base
  has_many :activities
  belongs_to :class
end