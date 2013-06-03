class Classroom < ActiveRecord::Base
  include Tenacity

  belongs_to :school
  has_many :students
  t_has_one :activity_template

end