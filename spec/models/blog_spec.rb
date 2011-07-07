require 'spec_helper'

describe Blog do
  
  before :each do
    Comic.destroy_all
    @comic = Comic.create(:title => "sample", :shortname => "smpl")
  end
  
  it "should default title field to title of comic" do
    @comic.blog.should_not == nil
    @comic.blog.title.should_not == nil
    @title = @comic.blog.title
    @title.should == @comic.title
  end
end
