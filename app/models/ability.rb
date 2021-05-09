# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.admin_role?
        can :manage, :all
    end

    if user.manager_role?
        can :manage, Consumer
        can :manage, Consumption
        can :manage, Distribution
        can :manage, Payment
        can [:new, :create, :index], User
    end

    if user.client_role?
        can :read, Consumer
        can :read, Consumption
        can :read, Distribution
        can :read, Payment
    end
  end
end
