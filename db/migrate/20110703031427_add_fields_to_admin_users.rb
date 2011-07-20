class AddFieldsToAdminUsers < ActiveRecord::Migration
  def self.up
    add_column :admin_users, :displayname, :string
  end

  def self.down
    remove_column :admin_users, :displayname
  end
end
