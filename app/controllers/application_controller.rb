class ApplicationController < ActionController::Base
  protect_from_forgery
  @active_comic = Setting.value_for_name 'featured_comic'
end
