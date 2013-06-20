class Classroom < ActiveRecord::Base
  include Tenacity

  attr_accessible :name, :school

  belongs_to :school
  has_many :students
  has_many :ksr_comments, :as => :commentable
  has_many :schedules
  t_has_one :activity_template

  def comment_for date = Date.today
    self.ksrcomemnts.where(:date_of_comment => date).first
  end
end