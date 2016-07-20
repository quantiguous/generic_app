module Base
  class Role < ActiveRecord::Base
    has_and_belongs_to_many :users, :class_name => 'Base::Users',:join_table => :users_roles
    belongs_to :resource, :polymorphic => true
    
    scopify
  end
end