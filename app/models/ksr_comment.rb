class KsrComment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true

  validates_uniqueness_of :commentable, :scope => [:date_of_comment]
end