class PagesController < ApplicationController
  def show
    #find the page to load based on parameters from the url
    @comic = Comic.find(params[:comic_id])    
    @page = Page.find_by_comic_id_and_sequence(params[:comic_id], params[:id])
  end

  def index
    @comic = Comic.find(params[:comic_id])
    @page = @comic.last_page
  end

end
