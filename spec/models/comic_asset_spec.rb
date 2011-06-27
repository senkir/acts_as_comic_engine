require 'spec_helper'

describe ComicAsset do
  before :all do
    @comic = Comic.new
    @comic.name = "Test Comic"
    @comic.shortname = "test"
    @comic.save
  end
  
  it "should raise an exception for a page without a comic_id" do
    page = Page.new
    lambda {page.next_in_sequence}.should raise_error
  end
  
  it "should return a reference to the comic model associated with the page" do
    page = Page.new
    @comic = Comic.find(1)
    page.comic_id = @comic.id
    page.sequence = 1
    page.save
    page.comic.should == @comic
  end
end