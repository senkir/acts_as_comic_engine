class AdminUserComic < ActiveRecord::Base
  belongs_to :comic
  belongs_to :contributor, :class_name => "AdminUser"
end
