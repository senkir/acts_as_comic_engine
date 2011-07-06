class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.integer :admin_user_id
      t.string :title
      
      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
