class AddInactiveToUser < ActiveRecord::Migration
  def change
    add_column :users, :inactive, :boolean, :default => false
  end
end
