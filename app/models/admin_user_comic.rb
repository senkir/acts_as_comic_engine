class AdminUserComic < ActiveRecord::Base
  belongs_to :comic
  belongs_to :admin_user
end
