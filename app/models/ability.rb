class Ability
    include CanCan::Ability
  
    def initialize(user)
      if user.role=="admin"
        can :manage, :all
      elsif user.role=="hr"
        can :manage,Hr
        can :manage,Employee
        can :read,Admin
      else
        can :manage,Employee
        can :read,Hr
        can :read,Admin
      end
    end
end

