class School < ActiveRecord::Base

  belongs_to :account
  has_many :students
  has_many :posts

end