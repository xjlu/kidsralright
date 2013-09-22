# A base STI class: parents, gardian, teacher, director, etc.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

  mount_uploader :avatar, AvatarUploader
  has_and_belongs_to_many :roles, join_table: "users_roles"
  belongs_to :school
  belongs_to :default_classroom, class_name: "Classroom"

  strip_attributes :only => [:email, :first_name, :last_name]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  attr_accessible :email, :first_name, :last_name, :phone

  def full_name
    @full_name ||= [first_name, last_name].join(" ").strip
  end
end