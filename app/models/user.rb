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

  # a teacher can access his school's classrooms
  def classrooms
    self.school.classrooms if is_teacher? || is_director?
  end

  def user_roles
    @user_roles ||= self.roles
  end

  # define helper methods for role checking
  def is_director?
    user_roles.include?(director_role)
  end

  def is_teacher?
    user_roles.include?(teacher_role)
  end

  def is_guardian?
    user_roles.include?(guardian_role)
  end

  def director_role
    @director_role ||= Role.find_by_name("director")
  end

  def teacher_role
    @teacher_role ||= Role.find_by_name("teacher")
  end

  def guardian_role
    @guardian_role ||= Role.find_by_name("guardian")
  end
end