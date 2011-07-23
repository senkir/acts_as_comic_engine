require 'spec_helper'

describe AdminUser do
  
  before :all do
    @owner = AdminUser.create(:email => "admin_user_spec@email.com", :displayname => "admin_user_spec")
    @comic = @owner.owned_comics.build
    @comic.title = "admin user spec comic"
    @comic.shortname = "ausc"
    @comic.save
  end
  
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
    #@comic.class.should == Comic.class
    @comic.owner_id.should == @user.id
  end
  
  it "should autocreate the avatar model with default values" do
    @user.avatar.should_not == nil
  end
  
  #method: contributes_to
  it "should return true if user is a contributor for a comic" do
    @comic.title = "admin user spec comic"
    @comic.shortname = "ausc"
    @comic.save
    @comic = Comic.find_by_shortname("ausc")
    @user.id.should_not == nil
    @comic.add_contributor @user
    result = @user.contributes_to @comic
    result.should == true
  end
  
  it "should return false if user is not a contributor for a comic" do
    @newUser = AdminUser.create(:email => "adminUserSpec@contributes_to.com", :displayname => "admin_user_spec")
    result = @newUser.contributes_to @comic
    result.should == false
  end
  
  pending "should throw an error if the class sent to contributes_to method is of incorrect type"do
    
  end
end
