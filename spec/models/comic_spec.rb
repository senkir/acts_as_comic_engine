require 'spec_helper'

describe Comic do
  
  before :all do
    Comic.destroy_all #required to prevent duplicate entries
    AdminUser.destroy_all
    @user = AdminUser.create(:email => "comic_spec@email.com", :displayname => "comic_spec_user")
    @comic = Comic.create(:title => "comic model test", :shortname => "comictest", :owner => @user)
  end
  
  # Method: basic setup
  it "should save data when owner, name and shortname have been set and not otherwise" do
    @thing = Comic.new
    @thing.title = "my test comic"
    result = @thing.save
    result.should == false
    @thing.shortname = "test2"
    result = @thing.save
    result.should == true
    @thing.owner = @user
    result = @thing.save
    result.should == true
  end
  
  it "should not allow duplicate shortnames or titles" do
    @user.id.should_not == nil
    Comic.create(:title => "comic", :shortname => "testaroo")
    @duplicate = Comic.create(:title => "comic", :shortname => "testaroo", :owner => @user)
    @duplicate.id.should == nil
    @duplicate = Comic.create(:title => "different", :shortname => "testaroo", :owner => @user)
    @duplicate.id.should == nil
    @duplicate = Comic.create(:title => "comic", :shortname => "different", :owner => @user)
    @duplicate.id.should == nil
    @duplicate = Comic.create(:title => "different", :shortname => "different", :owner => @user)
    result = @duplicate.save
    result.should == true
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
    @comic.visible_pages.empty?.should == true
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
  
  it "should be able to ADD a contributor for a comic" do
    result = @comic.add_contributor @user
    result.should_not == nil
  end
  
  it "should be able to REMOVE a contributor for a comic" do
    @comic.contributors.should_not == nil
    @comic.remove_contributor @user
    @remove_at_index = nil
    @contributors = @comic.contributors
    (1..@contributors.count).each do |i|
        @remove_at_index = i if @contributors[i].id == @user.id
    end
    @remove_at_index.should == nil
  end
  
end
