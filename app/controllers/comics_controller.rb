class ComicsController < ApplicationController
  
  def index
    @comics = Comic.all
  end
  
  def show
    #make sure an id exists
    if params[:id]
      @comic_id = params[:id]
    else
      redirect_to comics_path()
    end
    
    #figure out which comic needs to be retreived
    @comic = Comic.find(@comic_id)
  end
end
