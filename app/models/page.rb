class Page < ActiveRecord::Base
  include PagesHelper
  attr_accessible :title, :image, :sequence, :comic_id, :is_shown, :image_cache
  belongs_to :comic
  mount_uploader :image, PageUploader

  scope :ordered, :order => "sequence DESC"
  scope :visible, where("pages.is_shown = 1")
  scope :invisible, where("pages.is_shown <> 1")
  
  def self.by_comic comic_ids
    where(:comic_id => comic_ids)
  end
  
  #Validation
  validates_presence_of :comic_id
  
#  before_save :populate_sequence_if_nil
  before_save :validate_uniqueness_of_sequence
  
  def validate_uniqueness_of_sequence
    raise "Method undefined for nil comic" if self.comic_id == nil
    @comparisonPage = Page.find_by_comic_id_and_sequence(self.comic_id, self.sequence)
    raise "Error:  Page sequence number not unique (" + self.sequence.to_s + ")" if @comparisonPage != nil && @comparisonPage.id != self.id
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
  
end