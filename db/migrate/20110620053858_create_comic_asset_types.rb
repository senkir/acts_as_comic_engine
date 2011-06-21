class CreateComicAssetTypes < ActiveRecord::Migration
  def self.up
    create_table :comic_asset_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :comic_asset_types
  end
end
