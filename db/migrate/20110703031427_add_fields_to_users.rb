class AddFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :displayname, :string
  end

  def self.down
  end
end
