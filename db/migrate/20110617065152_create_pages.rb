class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.string :filename
      t.date :created_on
      t.date :modified_on
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
