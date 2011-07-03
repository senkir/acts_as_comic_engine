class Blog < ActiveRecord::Base
  belongs_to :admin_user
  has_many :posts
  
  attr_accessible :title, :admin_user_id
end
