class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.string :image
      t.date :created_on
      t.date :modified_on
      t.boolean :is_shown
      t.integer :sequence
      t.string :comic_oid

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
