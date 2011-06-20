class MainController < ApplicationController
  def index
    @buttons = HomeButton.all
    @featured_comic_id = 1
    @page = Page.find_last_by_comic_id_and_is_shown(@featured_comic_id, 't')
    @comic = Comic.find(@featured_comic_id)
  end

end
