require 'spec_helper'

describe ComicAsset do
  before :all do
    @type = ComicAssetType.new
    @type.name = "sample"
    @type.save
    @type = ComicAssetType.find_by_name("sample")
  end
  
  # Method: asset_type
  it "should return a reference to the asset type" do
    @asset = @type.comic_assets.build
    @asset.asset_type.should == @type
  end
  
  # Method: comic
  it "should return a reference to the comic model associated with the page" do
    page = Page.new
    @comic = Comic.find(1)
    page.comic_id = @comic.id
    page.sequence = 1
    page.save
    page.comic.should == @comic
  end
  
  
end