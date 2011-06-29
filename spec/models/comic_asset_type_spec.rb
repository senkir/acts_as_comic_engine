require 'spec_helper'

describe ComicAssetType do
  
  pending "should not allow duplicates of the same name"
  
  it "should not allow saving without name" do
    @type = ComicAssetType.new
    @type.save.should_not == true
  end
end