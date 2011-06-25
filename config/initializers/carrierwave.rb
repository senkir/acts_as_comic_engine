#Disable processing if in testing mode
CarrierWave.configure do |config|
  # Configure Uploaders to use S3 instead of Rails default
  config.storage = :fog
  
  # Configure credentials
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['S3_KEY'],      # required
    :aws_secret_access_key  => ENV['S3_SECRET'],       # required
#    :region                 => 'us-west-1'  # optional, defaults to 'us-east-1'
  }
  
  config.fog_directory  = 'https://amazonaws.com/spidermuffin_prod'                         # required
  
  if Rails.env.development?
    config.fog_directory = 'spidermuffin_dev'
  end
  
  if Rails.env.staging?
    config.fog_directory = 'https://amazonaws.com/spidermuffin_staging'
  end
#     config.fog_host       = 'https://s3.amazonaws.com/'            # optional, defaults to nil
#    config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false    
  end
end