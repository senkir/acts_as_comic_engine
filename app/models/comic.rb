class Comic < ActiveRecord::Base
  has_many :pages
  has_many :comic_assets
  attr_accessible :name, :shortname
  accepts_nested_attributes_for :pages, :comic_assets
  validates_presence_of :name, :shortname
  validates_uniqueness_of :name, :shortname
  
  def new_page
    @page = self.pages.build
    @page.sequence = @page.next_in_sequence
    @page
  end
  
end
