class Page < ActiveRecord::Base
  attr_accessible :title, :image, :sequence
  belongs_to :comic
  mount_uploader :image, PageUploader
  
  named_scope :ordered, :order => "sequence DESC"
  
  #Validation
  validates_presence_of :sequence
  
  def image=(val)
    if !val.is_a?(String) && valid?
      image_will_change!
      super
    end
  end
  
=begin
  def comic
    Comic.find(self.comic)
  end
=end  
  def next_in_sequence
    @pages = Comic.find(self.comic_id).pages
    if @pages == 0 || @pages == null
      @pages.count
    else
      0
    end
  end
end