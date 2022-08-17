# frozen_string_literal: true

# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     if user.admin?
#       can :manage, Employee
#       can :manage, Hr
#       can :manage, :all
#     else
#     elsif user.hr?
#       can :manage, :all
#       can :manage, Employee
#       can :read, admin
#     else
#       can :manage, :all
#       can :read, admin
#       can :read, Employee
#       can :read, hr
#     end
#   end
# end
