class Classroom < ActiveRecord::Base
  include tenacity

  belongs_to :account
  has_many :students
  t_has_one :activity_template

end