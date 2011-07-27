class MainController < ApplicationController
  
  def index
    #do stuff for the main controller
    @enable_featured_comic = Setting.enabled_for_name "enable_featured_comic"
  end
end
