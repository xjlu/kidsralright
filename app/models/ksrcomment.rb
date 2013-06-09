class Ksrcomment < ActiveRecord::Base

  strip_attributes :only => [:comment]

  attr_accessible :comment, :date_of_comment, :user

  belongs_to :commentable, :polymorphic => true
  validates_uniqueness_of :commentable, :scope => [:date_of_comment]

end