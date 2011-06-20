class CreateComicAssets < ActiveRecord::Migration
  def self.up
    create_table :comic_assets do |t|
      t.integer :comic_asset_type_id
      t.string :image
      t.date :created_on
      t.date :modified_on
      t.string :comic_oid

      t.timestamps
    end
  end

  def self.down
    drop_table :comic_assets
  end
end
