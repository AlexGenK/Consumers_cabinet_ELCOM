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
        can :manage, EicCode
        can :read, Purveyor
        can [:new, :create, :index], User
        can :show, :annual_consumption
        can :index, :commercial_information
        can :index, :source
    end

    if user.client_role?
        can [:read, :edit, :update], Consumer
        can [:index, :show, :selector], Consumption
        can [:index, :show, :selector], Distribution
        can :read, Payment
        can :read, EicCode
        can :read, Purveyor
        can :show, :annual_consumption
        can :index, :commercial_information
        can :index, :source
    end
  end
end
