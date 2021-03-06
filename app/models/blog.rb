class Blog < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :comic
  
  has_many :posts
  
  attr_accessible :title, :comic_id
  accepts_nested_attributes_for :posts
  before_save :build_title
  
  def build_title
    @title = self.title
    if @title == nil || @title == ""
      self.title = self.comic.title
    end
  end
end
