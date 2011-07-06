class AddComicIdToBlogs < ActiveRecord::Migration
  def self.up
    add_column :blogs, :comic_id, :integer
  end

  def self.down
    remove_column :blogs, :comic_id
  end
end
