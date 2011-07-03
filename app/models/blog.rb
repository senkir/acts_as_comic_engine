class Blog < ActiveRecord::Base
  belongs_to :admin_user
  has_many :posts
  
  attr_accessible :title, :admin_user_id
  
  before_save :build_title
  
  def build_title
    @title = self.title
    if @title == nil || @title == ""
      self.title = self.admin_user.displayname
    end
  end
end
