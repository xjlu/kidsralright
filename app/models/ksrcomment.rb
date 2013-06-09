class Ksrcomment < ActiveRecord::Base

  attr_accessible :comment, :date_of_comment, :user

  belongs_to :commentable, :polymorphic => true
  validates_uniqueness_of :commentable, :scope => [:date_of_comment]
end