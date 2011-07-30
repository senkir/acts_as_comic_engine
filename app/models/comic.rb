class Comic < ActiveRecord::Base
  has_many :pages
  has_many :comic_assets
  has_many :contributors, :through => :admin_user_comic, :class_name => 'AdminUser', :foreign_key => "contributor_id"
  has_many :admin_user_comic
  has_one :blog
  belongs_to :owner, :class_name => 'AdminUser'
  
  attr_accessible :title, :shortname, :has_blog, :owner_id, :contributor_ids
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
    Page.find_all_by_comic_id_and_is_shown(self.id, 1, :order => :sequence)
  end
  
  #returns the last in sequence
  def last_page
    self.visible_pages.last if self.visible_pages != nil
  end
  
  
  #comics must have one blog defined
  def autocreate_blog 
    @blog = self.build_blog
    @blog.is_default = true
    @blog.title = self.title
    @blog.save
  end
  
  #add contributors
  def add_contributor user
    # if self.contributors == nil
    #   self.contributors.build
    # end
    # @join = AdminUserComic.create(:contributor => user, :comic => self)
    self.contributors << user
    self.contributors
    self.save
  end
  
  #remove contributors
  def remove_contributor user
    throw "Cannot remove nil user" if user == nil
    #@join = self.contributors
    # @join = AdminUserComic.find_by_comic_id_and_contributor_id(self.id, user.id)
    @contributors = self.contributors
    @remove_at_index = nil
    (1..@contributors.count - 1).each do |i|
        @remove_at_index = i if @contributors[i].id == user.id
    end
    contributors.remove_at @remove_at_index if @remove_at_index != nil  
  end

end
