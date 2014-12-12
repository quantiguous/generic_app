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
    can :manage, User
    cannot :destroy, User
    can :manage, AdminUser, :id=>@user.id
    cannot :destroy, AdminUser
    cannot :create, AdminUser
  end

  def admin_permissions
    can :read, User
    cannot :destroy, AdminUser
    cannot :create, AdminUser
  end

  def super_admin_permissions
    can :manage, AdminUser
    cannot :destroy, AdminUser, :id=>@user.id
  end
end
