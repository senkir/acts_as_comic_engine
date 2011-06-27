class Page < ActiveRecord::Base
  include PagesHelper
  attr_accessible :title, :image, :sequence
  belongs_to :comic
  mount_uploader :image, PageUploader

  named_scope :ordered, :order => "sequence DESC"
  
  #Validation
  validates_presence_of :comic_id
  
#  before_save :populate_sequence_if_nil
  before_save :validate_uniqueness_of_sequence
  
  # def populate_sequence_if_nil
  #   if !self.sequence?
  #     self.sequence = self.next_in_sequence
  #   end
  # end
  
  def validate_uniqueness_of_sequence
    raise "Method undefined for nil comic" if self.comic_id == nil
    raise "Error:  Page sequence number not unique (" + self.sequence + ")" if Page.find_by_comic_id_and_sequence(self.comic_id, self.sequence) != nil
  end
  
  def image=(val)
    if !val.is_a?(String) && valid?
      image_will_change!
      super
    end
  end

  def next_in_sequence
    raise "Unable to build sequence.  No Comic Defined For Page." if self.comic_id == nil
    next_in_sequence_for_comic self.comic
  end
  
  def comic
      raise "No Comic Defined For Page" if self.comic_id == nil
      Comic.find(self.comic_id)
  end
  
end