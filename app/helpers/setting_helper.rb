module SettingHelper
  def value_for_name name
    @setting = Setting.find_by_setting_name(name)
    @setting.setting_value
  end
end
