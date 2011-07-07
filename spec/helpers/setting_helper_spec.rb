require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the SettingHelper. For example:
#
# describe SettingHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe SettingHelper do
  it "should be able to return the setting value matching a particular name" do
    Setting.create(:setting_name => "mysetting", :setting_value => "value")
    @result = value_for_name 'mysetting'
    @result.should == "value"
  end
end
