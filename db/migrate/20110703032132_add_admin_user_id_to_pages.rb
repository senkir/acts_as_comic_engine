class AddAdminUserIdToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :admin_user_id, :string
  end

  def self.down
    remove_column :pages, :admin_user_id
  end
end
