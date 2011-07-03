class ComicAsset < ActiveRecord::Base
  mount_uploader :image, ComicAssetUploader
  attr_accessible :image
  belongs_to :comic_asset_type
  belongs_to :comic
  
  validates_presence_of :comic_asset_type_id, :comic_id
  
  def asset_type
    raise "No Asset Type Defined for Comic Asset" if self.comic_asset_type_id == nil
    ComicAssetType.find(self.comic_asset_type_id)
  end
end
