class AddShortnameToComics < ActiveRecord::Migration
  def self.up
    add_column :comics, :shortname, :string
  end

  def self.down
    remove_column :comics, :shortname
  end
end
