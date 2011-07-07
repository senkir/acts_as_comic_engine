class Setting < ActiveRecord::Base
  validates_presence_of :setting_name, :setting_value  
end
