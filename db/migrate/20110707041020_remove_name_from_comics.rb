class RemoveNameFromComics < ActiveRecord::Migration
  def self.up
    remove_column :comics, :name
  end

  def self.down
    add_column :comics, :name, :string
  end
end
