class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :admin_user
  validates_presence_of :admin_user_id, :blog_id, :title, :body
end
