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
  
  pending "should be able to see which comics user is a contributor for" do
    @comic = @user.admin_user_comic.build
    @comic.should_not == nil
  end
  
  pending "should be able to add and remove contributors"
  
  it "should be able to create a comic with self as the owner" do
    @comic = @user.owned_comics.build
    @comic.owner_id.should == @user.id
  end
  
  # it "should autocreate the avatar model with default values" do
  #   @user.avatar.should_not == nil
  # end
  
  it "should be able to access the avatar image field" do
    @user.avatar.should_not == nil
  end
  
end
