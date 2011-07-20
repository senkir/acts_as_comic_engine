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
  pending "should return a reference to the comic model associated with the page" do
    @comic = Comic.create(:title => 'comicassetsample', :shortname => 'cas')
  end
  
  
end