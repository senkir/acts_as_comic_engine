class CreateComicAssets < ActiveRecord::Migration
  def self.up
    create_table :comic_assets do |t|
      t.string :image
      t.integer :comic_id
      t.integer :comic_asset_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comic_assets
  end
end
