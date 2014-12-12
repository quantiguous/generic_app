class AdminRole < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :admin_users, :join_table => :admin_users_admin_roles
  belongs_to :resource, :polymorphic => true
  
  scopify
end
