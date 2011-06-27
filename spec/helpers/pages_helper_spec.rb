require 'spec_helper'

describe PagesHelper do
  before :all do
    @comic = Comic.new
    @comic.name = "Test Comic"
    @comic.shortname = "test"
    @comic.save
  end
  # Method: next_in_sequence
  it "should raise an error if model is of the wrong class" do
    setting = Setting.new
    lambda { next_in_sequence_for_comic setting }.should raise_error
  end
  
  it "should raise an exception for a Page without a comic_id" do
    page = Page.new
    lambda {page.next_in_sequence}.should raise_error
  end
  
  it "should return 1 for a new comic" do
    (next_in_sequence_for_comic @comic).should == 1
  end
  
  it "should return one more than the current object count" do
    @page = @comic.pages.build
    @page.save
    @nextPage = @comic.pages.build
    @nextPage.next_in_sequence.should == @comic.pages.count + 1
  end
  
end