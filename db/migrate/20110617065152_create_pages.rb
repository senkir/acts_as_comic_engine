class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.string :image
      t.boolean :is_shown
      t.integer :sequence
      t.integer :comic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
