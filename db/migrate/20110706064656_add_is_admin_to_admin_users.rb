class AddIsAdminToAdminUsers < ActiveRecord::Migration
  def self.up
    add_column :admin_users, :is_admin, :boolean
  end

  def self.down
    remove_column :admin_users, :is_admin
  end
end
