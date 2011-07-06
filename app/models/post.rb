class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :admin_user
end
