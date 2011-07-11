require 'spec_helper'

describe Comic do
  
  before :all do
    Comic.destroy_all #required to prevent duplicate entries
    @comic = Comic.create(:title => "comic model test", :shortname => "comictest")
    @comic.reload
  end
  
  # Method: basic setup
  it "should save data when name and shortname have been set and not otherwise" do
    @thing = Comic.new
    @thing.title = "my test comic"
    result = @thing.save
    result.should == false
    @thing.shortname = "test2"
    result = @thing.save
    result.should == true
  end
  
  it "should not allow duplicate shortnames or titles" do
    Comic.create(:title => "comic", :shortname => "testaroo")
    @duplicate = Comic.create(:title => "comic", :shortname => "testaroo")
    @duplicate.id.should == nil
    @duplicate = Comic.create(:title => "different", :shortname => "testaroo")
    @duplicate.id.should == nil
    @duplicate = Comic.create(:title => "comic", :shortname => "different")
    @duplicate.id.should == nil
    @duplicate = Comic.create(:title => "different", :shortname => "different")
    @duplicate.id.should_not == nil
  end
  
  # Method: new_page
  it "should return a preloaded instance of the next page" do
    @comic.id.should_not == nil
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
  
  # Method: last_page
  it "should be able to create a blog" do
    @blog = @comic.build_blog
    @blog.should_not == nil
  end
  
  it "should create a blog when a new user is created" do
    @comic.should_not == nil
    @comic.blog.should_not == nil
  end
  
  pending "should be able to add and remove contributors for a comic"
end
