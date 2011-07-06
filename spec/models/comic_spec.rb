require 'spec_helper'

describe Comic do
  
  before :all do
    @comic = Comic.new
    @comic.name = "test comic"
    @comic.shortname = "test"
    @comic.save
    @comic = Comic.find_by_shortname("test")
  end
  
  # Method: basic setup
  it "should save data when name and shortname have been set" do
    @comic = Comic.new
    @comic.name = "my test comic"
    @comic.shortname = "test2"
    @comic.save
    @comic.name.should_not == nil
    @comic.shortname.should_not == nil
  end
  
  pending "should not allow duplicate shortnames" do
    
  end
  
  # Method: new_page
  it "should return a preloaded instance of the next page" do
    @page = @comic.new_page
    @page.should_not == nil
    @page.comic_id.should_not == nil
    @page.sequence.should_not == nil
  end
  
  it "should only return pages which are visible to the user" do
    @page = @comic.new_page
    @page.save
    @comic.visible_pages.should == nil
    @page.is_shown = true
    @page.save
    @comic.visible_pages.should_not == nil
  end
end
