class AddBodyToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :body, :string
  end

  def self.down
    remove_column :posts, :body
  end
end
