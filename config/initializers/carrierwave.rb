# Configure Uploaders to use S3 instead of Rails default
CarrierWave.configure do |config|
  config.storage = :s3
end