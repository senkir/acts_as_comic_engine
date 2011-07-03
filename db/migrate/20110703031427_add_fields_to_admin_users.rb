class AddFieldsToAdminUsers < ActiveRecord::Migration
  def self.up
    add_column :admin_users, :displayname, :string
  end

  def self.down
  end
end
