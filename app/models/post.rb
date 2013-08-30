class Post < ActiveRecord::Base

  strip_attributes :only => [:message]
  belongs_to :school
  belongs_to :classroom

  validate :school, :presence => true
  validate :message, :presence => true

  has_many :students
end