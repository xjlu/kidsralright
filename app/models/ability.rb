class Ability
  include CanCan::Ability
  attr_reader :user

  def initialize(user)
    @user = user
    build_permissions
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end

  def build_permissions
    if is_director?
      can :manage, :all
    end

    if is_teacher?
      can [:read, :create], Post, classroom: {school_id: user.school_ids}
    end
  end

  def user_roles
    @user_roles ||= @user.roles
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
