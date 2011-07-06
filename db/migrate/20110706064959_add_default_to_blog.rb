class AddDefaultToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :is_default, :boolean
  end

  def self.down
    remove_column :blogs, :is_default
  end
end
