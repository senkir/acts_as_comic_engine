class RemoveAvatarImageFromAdminUser < ActiveRecord::Migration
  def self.up
    remove_column :admin_users, :avatar_image
  end

  def self.down
    add_column :admin_users, :avatar_image, :string
  end
end
