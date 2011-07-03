require 'spec_helper'

describe AdminUser do
  
  before :each do
    @user = AdminUser.new
    @user.displayname = "sample user"
    @user.password = "password"
    @user.email = "email@sample.com"
    @user.save
    @user = AdminUser.find_by_displayname("sample user")
  end
    
  it "should require a display name and email when a new user is created" do
    @user = AdminUser.new
    @user.displayname = "sample user2"
    @user.password = "password"
    valid = @user.save
    valid.should == false
    @user.email = "email2@sample.com"
    valid = @user.save
    valid.should == true
  end
  
  it "should be able to create a blog" do
    @blog = @user.build_blog
    @blog.should_not == nil
  end
  
  it "should create a blog when a new user is created" do
    @user.should_not == nil
    @user.blog.should_not == nil
  end
end
