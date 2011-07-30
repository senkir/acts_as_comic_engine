module PagesHelper
  #determines what the next sequence number should be.
  #this method has nothing to do wih actual display properties.
  def next_in_sequence_for_comic comic
    raise "Class invalid for this method (arg is of class " + comic.class.to_s + ".  Need " + Comic.class.to_s + ")" if comic.class != Comic
    pages = comic.pages
    if pages.count == 0 || pages == nil
      1
    else
      pages.count + 1
    end    
  end
  
end
