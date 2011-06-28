ActiveAdmin.register Page do
  menu :parent => "Comics"
  
  before_filter do
    @page = nil
    if params[:comic] != nil
      @page = Comic.find(params[:comic]).new_page
    end
  end
  
  index do
    column "Title" do |page|
      link_to page.title, admin_page_path(page.id)
    end
    column :comic_id
    column :sequence
  end
  
  form :partial => "form", :locals => {:page => @page}
  
  show do
    render "show"
  end
end
