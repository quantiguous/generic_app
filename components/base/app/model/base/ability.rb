module Base
  class Ability
    include CanCan::Ability

    def initialize(user_obj)
      # The order of the below methods are much important
      @user = user_obj
      @user ||= User.new # guest @user (not logged in)
      super_admin_permissions if @user.has_role? :super_admin
      admin_permissions if @user.has_role? :admin
      user_admin_permissions if @user.has_role? :user_admin
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    end

    def user_admin_permissions
      can :manage, Base::User
      cannot :destroy, Base::User
      can :manage, Base::AdminUser, :id=>@user.id
      cannot :destroy, Base::AdminUser
      cannot :create, Base::AdminUser
    end

    def admin_permissions
      can :read, Base::User
      cannot :destroy, Base::AdminUser
      cannot :create, Base::AdminUser
    end

    def super_admin_permissions
      can :manage, Base::AdminUser
      cannot :destroy, Base::AdminUser, :id=>@user.id
    end
  end
end