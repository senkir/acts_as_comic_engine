RailsAdmin.config do |config|
  config.included_models = [Comic, ComicAsset, ComicAssetType, Page, Setting]
  config.excluded_models = [User]
  
# Support for carrierwave from https://gist.github.com/884835
# Register a custom field factory and field type for CarrierWave if its defined
if defined?(::CarrierWave)
  module RailsAdmin::Config::Fields::Types
    # Field type that supports CarrierWave file uploads
    class CarrierWaveFile < RailsAdmin::Config::Fields::Types::FileUpload
      register_instance_option(:partial) do
        :form_carrier_wave_file
      end
    end
    
    # Field type that supports CarrierWave file uploads with image preview
    class CarrierWaveImage < CarrierWaveFile
      register_instance_option(:partial) do
        :form_carrier_wave_image
      end
    end
    
    # Register field type to the types registry
    register(:carrier_wave_file, CarrierWaveFile)
    register(:carrier_wave_image, CarrierWaveImage)
  end
  RailsAdmin::Config::Fields.register_factory do |parent, properties, fields|
    model = parent.abstract_model.model
    if model.kind_of?(CarrierWave::Mount) && model.uploaders.include?(properties[:name])
      type = properties[:name] =~ /image|picture|thumb/ ? :carrier_wave_image : :carrier_wave_file
      fields << RailsAdmin::Config::Fields::Types.load(type).new(parent, properties[:name], properties)
      true
    else
      false
    end
  end
end

  config.model Comic do
    dropdown "Comic Properties"
  end
  
  config.model ComicAsset do
    parent Comic    
  end
  
  config.model Page do 
    parent Comic
    
    edit do
      field :title
      field :image, :carrier_wave_file
      field :comic_id
      
    end
    
  end
  
  config.model ComicAssetType do
    parent Setting
  end
  
  config.model Setting do
    label "App Setting"
  end
end