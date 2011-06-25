class Page < ActiveRecord::Base
  attr_accessible :title, :image, :sequence
  belongs_to :comic
  mount_uploader :image, PageUploader
end