ActiveAdmin.register Page do
  menu :parent => "Comics"
  
  before_filter do
    @page = nil
    if params[:id] != nil
      @page = Comic.find(params[:id]).new_page
    end
  end
  
  index do
    column :title
    column :comic_id
    column :sequence
  end
  
  form :partial => "form", :locals => {:page => @page}

end
