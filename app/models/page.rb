class Page < ActiveRecord::Base
  add_column :string
  mount_uploader :filename, PageUploader
end
