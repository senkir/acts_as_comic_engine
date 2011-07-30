class Setting < ActiveRecord::Base
  validates_presence_of :setting_name, :setting_value  

  def self.value_for_name name
    @setting = Setting.find_by_setting_name(name)
    if @setting != nil
      @setting.setting_value
    else
      nil
    end
  end
  
  def self.enabled_for_name name
    result = self.value_for_name name
    if result == true || result == "1"
      true
    else
      false
    end
  end
end
