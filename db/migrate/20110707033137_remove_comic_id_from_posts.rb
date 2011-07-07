class RemoveComicIdFromPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :comic_id
  end

  def self.down
    add_column :posts, :comic_id, :integer
  end
end
