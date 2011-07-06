class Comic < ActiveRecord::Base
  has_many :pages
  has_many :comic_assets
  has_many :admin_users, :through => :admin_users_comic
  has_one :blog
  
  attr_accessible :name, :shortname
  accepts_nested_attributes_for :pages, :comic_assets, :blog
  validates_presence_of :name, :shortname
  validates_uniqueness_of :name, :shortname
  
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
end
