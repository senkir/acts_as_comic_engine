class CreateComics < ActiveRecord::Migration
  def self.up
    create_table :comics do |t|
      t.string :name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :comics
  end
end
