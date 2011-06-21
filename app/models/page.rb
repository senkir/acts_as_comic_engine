class Page < ActiveRecord::Base
  mount_uploader :image, PageUploader
  belongs_to :comic
end