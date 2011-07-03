class AddAvatarImageToAdminUser < ActiveRecord::Migration
  def self.up
    add_column :admin_users, :avatar_image, :string
  end

  def self.down
    remove_column :admin_users, :avatar_image
  end
end
