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

  def next_in_sequence
    raise "No Comic Defined For Page" if self.comic_id == nil
    @pages = Comic.find(self.comic_id).pages
    if @pages.count == 0 || @pages == nil
      1
    else
      @pages.count
    end      
  end
end