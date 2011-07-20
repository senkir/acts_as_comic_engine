class Avatar < ActiveRecord::Base
    mount_uploader :avatar_image, AvatarUploader
    belongs_to :admin_user
end
