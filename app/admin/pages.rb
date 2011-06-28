ActiveAdmin.register Page do
  menu :parent => "Comics"
  
  @page = nil
  if params[:id] != nil
    @page = comic.find(params[:id]).new_page
  end
  index do
    column :title
    column :comic_id
    column :sequence
  end
  
  form :partial => "form", :locals => {:page => @page}
end
