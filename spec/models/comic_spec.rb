require 'spec_helper'

describe Comic do
  it "should save data when name and shortname have been set" do
    @comic = Comic.new
    @comic.name = "test comic"
    @comic.shortname = "test"
    @comic.save
    @comic.name.should_not == nil
    @comic.shortname.should_not == nil
  end
  
end
