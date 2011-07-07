class AddTitleToComics < ActiveRecord::Migration
  def self.up
    add_column :comics, :title, :string
  end

  def self.down
    remove_column :comics, :title
  end
end
