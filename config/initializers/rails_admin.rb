RailsAdmin.config do |config|
  config.included_models = [Comic, ComicAsset, ComicAssetType, Page, Setting]
  config.excluded_models = [User]
  
  config.model Page do 
    parent Comic
  end
  
  config.model Comic do
    dropdown "Comic Properties"
  end
  
  config.model ComicAsset do
    parent Comic
  end
  
  config.model ComicAssetType do
    parent Setting
  end
  
  config.model Setting do
    label "App Setting"
  end
end