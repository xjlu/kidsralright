class Post < ActiveRecord::Base

  strip_attributes :only => [:message]

  belongs_to :classroom # this essentially is the classroom's whiteboard
  belongs_to :creator, :class_name => 'User'
  has_many :photos

  validate :classroom, :presence => true
  validate :creator, :presense => true
  validate :message, :presence => true
end