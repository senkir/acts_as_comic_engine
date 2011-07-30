require 'spec_helper'

describe Page do
  before :all do
    Comic.destroy_all
    @comic = Comic.create(:title => "page model test", :shortname => "sample")
  end
  
  # Method: next_in_sequence
  it "should raise an exception for a Page without a comic_id" do
    page = Page.new
    lambda {page.next_in_sequence}.should raise_error
  end
  
  #page.next_in_sequence
  it "should return sequence of 1 for a new comic" do
    page = @comic.pages.build
    page.should_not == nil
    page.auto_sequence
    page.next_in_sequence.should == 1
    page.save.should_not == false
    @comic.save
  end
  
  it "should return sequence of an incremented value for non-new comics" do
    first_page = @comic.pages.build
    first_page.comic.should_not == nil
    first_page.auto_sequence
    @comic.save
    first_page.save
    first_page.should_not == nil
    page = @comic.pages.build
    page.next_in_sequence.should == first_page.sequence + 1
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
    @page.auto_sequence
    @page.save
    @duplicate = @comic.pages.build
    @duplicate.sequence = @page.sequence
    lambda {@duplicate.validate_uniqueness_of_sequence}.should raise_error
  end
  
  pending "should not raise an exception if model sequence returns itself"
  
  pending "should raise an exception if searching for sequence results in more than one record"
  
  #page.next
  it "should return nil when fetching next page if there is no following visible page" do
    #make some new pages
    for i in 0..10
      page = @comic.pages.build
      page.sequence = page.next_in_sequence
      page.is_shown = 1
      page.save
      @comic.save
    end
    @comic.reload
    page = @comic.pages.last
    page.next.should == nil
  end

it "should be able to fetch the next visible page for the comic" do
  @comic.reload
  @comic.pages.should_not == nil
    page = @comic.pages.first
    next_page = page.next
    next_page.should_not == nil
    next_page.class.should == Page
  end
  
  #page.is_last
  it "should return ture on 'is_last' if it is the last visible page and false otherwise" do 
    page = @comic.pages.first
    page.is_last.should == false
    page = @comic.pages.last
    page.is_last.should == true
  end
end