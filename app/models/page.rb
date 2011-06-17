class Page < ActiveRecord::Base
  mount_uploader :file, PageUploader
end