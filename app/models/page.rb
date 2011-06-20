class Page < ActiveRecord::Base
  mount_uploader :image, PageUploader
  belongs_to :comic, :foreign_key => :comic_oid
end