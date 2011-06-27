require 'spec_helper'

describe Page do
  before :each do
    @comic = Comic.new
    @comic.name = "Test Comic"
    @comic.shortname = "test"
    @comic.save
  end
  
  it "the next_in_sequence method should raise an exception for a Page without a comic_id" do
    page = Page.new
    lambda {page.next_in_sequence}.should raise_error
  end
  
  it "the next in sequence method should return 1 for a new comic" do
    page = Page.new
    page.comic_id = @comic.id
    page.next_in_sequence.should == 1
  end
end