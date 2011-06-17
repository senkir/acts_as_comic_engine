class CreateComicAssets < ActiveRecord::Migration
  def self.up
    create_table :comic_assets do |t|
      t.string :asset_type
      t.string :image
      t.date :created_on
      t.date :modified_on
      t.integer :comic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comic_assets
  end
end
