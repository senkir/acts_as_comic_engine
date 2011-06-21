RailsAdmin.config do |config|
  config.included_models = [Comic, ComicAsset, ComicAssetType, Page, Setting]
  config.excluded_models = [User]
  
  config.model Page do 
  end
  
  config.model Comic do
    
  end
  
  config.model ComicAsset do
    
  end
  
  config.model ComicAssetType do
    
  end
  
  config.model Setting do
    label "App Setting"
  end
end

RailsAdmin.config {|c| c.label_methods << :comic_name}