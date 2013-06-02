class Post < ActiveRecord::Base

  belongs_to :school
  belongs_to :classroom

  validate :school, :presence => true
end