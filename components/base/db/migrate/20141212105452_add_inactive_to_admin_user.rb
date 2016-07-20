class AddInactiveToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :inactive, :boolean, :default => false
  end
end
