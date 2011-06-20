class ComicAsset < ActiveRecord::Base
  mount_uploader :image, ComicAssetUploader
  belongs_to :comic_asset_type
  belongs_to :comic, :foreign_key => :comic_oid
end
