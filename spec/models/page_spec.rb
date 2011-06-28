require 'spec_helper'

describe Page do
  before :all do
    @comic = Comic.new
    @comic.name = "Test Comic"
    @comic.shortname = "test"
    @comic.save
    @comic = Comic.find_by_shortname("test")
  end
  
  #Method: Building of Page
  it "should save appropriate data" do
    @page = Page.new
    @page.comic_id = @comic.id
    @page.sequence = 1
    @page.save
    @page.comic_id.should_not == nil
    @page.sequence.should_not == nil
  end
  
  # Method: next_in_sequence
  it "should raise an exception for a Page without a comic_id" do
    page = Page.new
    lambda {page.next_in_sequence}.should raise_error
  end
  
  it "should return sequence of 1 for a new comic" do
    page = @comic.pages.build
    page.next_in_sequence.should == 1
  end
  
  # Method: comic
  it "should raise an exception for a page without a comic_id" do
    page = Page.new
    lambda {page.next_in_sequence}.should raise_error
  end
  
  it "should return a reference to the comic model associated with the page" do
    page = Page.new
    page.comic_id = @comic.id
    page.save
    page.comic.should == @comic
  end
  
  #Method: validate_uniqueness_of_sequence
  it "should raise an exception if there is a duplicate record" do
    @page = @comic.pages.build
    @page.save
    @duplicate = @comic.pages.build
    @duplicate.sequence = @page.sequence
    lambda {@duplicate.validate_uniqueness_of_sequence}.should raise_error
  end
  
  pending "should not raise an exception if model sequence itself"
  
  pending "should raise an exception if searching for sequence results in more than one record"
end