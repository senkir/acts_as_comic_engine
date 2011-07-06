# encoding: utf-8

class ComicAssetUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick

  def store_dir
    "comics/#{model.comic.shortname}/#{model.class.to_s.underscore}/#{model.asset_type}/#{model.id}"
  end
  def cache_dir
    "#{Rails.root}/tmp/uploads" # for heroku read-only filesystem
                                # see http://codingfrontier.com/carrierwave-on-heroku
  end
    # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    "/images/fallback/" + [version_name, "banner.png"].compact.join('_')
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [200, 300]
  end
    
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
