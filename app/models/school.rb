class School < ActiveRecord::Base

  strip_attributes :only => [:name, :address]
  attr_accessible :name, :address, :account

  belongs_to :account
  has_many :students
  has_many :posts
  has_many :classrooms
  has_many :users

  after_create :create_default_activity_list



  private

  # create default activity list, but the user can modify them if necessary
  def create_default_activity_list
  end
end