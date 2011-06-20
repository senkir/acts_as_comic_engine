class Setting < ActiveRecord::Base
  validates_presence of :setting_name, :setting_value
end
