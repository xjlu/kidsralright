class Student < ActiveRecord::Base
  has_many :guardians
  has_many :posts

end