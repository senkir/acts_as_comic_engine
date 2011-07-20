# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "#{model.class.to_s.underscore}/#{model.id}/#{model.asset_type}"
  end
  def cache_dir
    "#{Rails.root}/tmp/uploads" # for heroku read-only filesystem
                                # see http://codingfrontier.com/carrierwave-on-heroku
  end
    # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    "/images/fallback/" + [version_name, "avatar.png"].compact.join('_')
  end
  
  # Process files as they are uploaded:
  process :scale => [150, 150]
  
  def scale(width, height)
    # do something
    process :resize_to_fit => [width, height]
  end
  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [50, 50]
  end
    
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
