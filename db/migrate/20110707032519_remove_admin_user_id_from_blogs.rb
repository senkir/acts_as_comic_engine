class RemoveAdminUserIdFromBlogs < ActiveRecord::Migration
  def self.up
    remove_column :blogs, :admin_user_id
  end

  def self.down
    add_column :blogs, :admin_user_id, :integer
  end
end
