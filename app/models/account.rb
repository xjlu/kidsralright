class Account < ActiveRecord::Base

  strip_attributes :only => [:name]
  attr_accessible :name
  has_many :schools

end