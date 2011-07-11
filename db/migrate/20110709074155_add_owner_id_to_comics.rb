class AddOwnerIdToComics < ActiveRecord::Migration
  def self.up
    add_column :comics, :owner_id, :integer
  end

  def self.down
    remove_column :comics, :owner_id
  end
end
