class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.string :admin_user_id
      t.string :comic_id
      t.string :edited_by
      t.string :blog_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
