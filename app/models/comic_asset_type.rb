class ComicAssetType < ActiveRecord::Base
  has_many :comic_assets
  validates_presence_of :name
  attr_accessible :name
end
