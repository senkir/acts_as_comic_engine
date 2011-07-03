require 'spec_helper'

describe Blog do
  
  before :each do
    @user = AdminUser.new
    @user.displayname = "sample user"
    @user.email = "sample@email.com"
    @user.password = "password"
    @user.save
    @user = AdminUser.find_by_displayname("sample user")
  end
  
  it "should default title field to " do
    @user.blog.should_not == nil
    @user.blog.title.should_not == nil
    @title = @user.blog.title
    @title.should == @user.displayname
  end
end
