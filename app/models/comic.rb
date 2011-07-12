class Comic < ActiveRecord::Base
  has_many :pages
  has_many :comic_assets
  has_many :contributors, :through => :admin_user_comic
  has_many :admin_user_comic
  has_one :blog
  belongs_to :owner, :class_name => 'AdminUser'
  
  attr_accessible :title, :shortname
  accepts_nested_attributes_for :pages, :comic_assets, :blog, :contributors, :owner
  validates_presence_of :title, :shortname
  validates_uniqueness_of :title, :shortname
  
   after_save :autocreate_blog

  #build a new page and feed it the proper sequence number for this comic
  def new_page
    @page = self.pages.build
    @page.sequence = @page.next_in_sequence
    @page 
  end
  
  #always returns just the visible pages
  def visible_pages
    Page.find_by_comic_id_and_is_shown(self.id, 1, :order => :sequence)
  end
  
  #returns the last in sequence
  def last_page
    self.visible_pages.last if self.visible_pages != nil
  end
  
  
  #users must have at least one blog defined
  def autocreate_blog 
    @blog = self.build_blog
    @blog.is_default = true
    @blog.title = self.title
    @blog.save
  end
end
