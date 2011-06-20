class ComicsController < ApplicationController
  def show
    #make sure an id exists
    if params[:id]
      @comic_id = params[:id]
    else
      redirect_to comics_path()
    end
    
    #figure out which comic needs to be retreived
    @comic = Comic.find(@comic_id)        
    #find the page for that comic
    @page = Page.find_last_by_comic_id(@comic_id)
    redirect_to(@page)    
  end

  def index
    @comics = Comic.all
  end

end
