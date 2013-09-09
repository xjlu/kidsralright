class Post < ActiveRecord::Base

  strip_attributes :only => [:message]

  belongs_to :classroom # this essentially is the classroom's whiteboard
  belongs_to :creator, :class_name => 'User'
  has_many :photos

  validate :school, :presence => true
  validate :message, :presence => true
end