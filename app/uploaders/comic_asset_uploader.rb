# encoding: utf-8

class ComicAssetUploader < CarrierWave::Uploader::Base
  
  def store_dir
    "comics/#{model.comic.shortname}/#{model.class.to_s.underscore}/#{model.asset_type}/#{model.id}"
  end
  def cache_dir
    "#{Rails.root}/tmp/uploads" # for heroku read-only filesystem
                                # see http://codingfrontier.com/carrierwave-on-heroku
  end
  # def s3_bucket 
  #   "#{model.comic_guid}"
  # end 
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
