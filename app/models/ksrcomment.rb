class Ksrcomment < ActiveRecord::Base

  attr_accessible :comment, :date_of_comment, :user

  belongs_to :commentable, :polymorphic => true
  validates_uniqueness_of :commentable, :scope => [:date_of_comment]

  before_save :strip_white_space

  def strip_white_space
    self.comment.strip!
  end
end