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
    column "preview" do |preview|
      image_tag(preview.image.thumb.url)
    end
    column "comic" do |page|
      page.comic.name
    end
    column :sequence
  end
  
  form :partial => "form", :locals => {:page => @page}
  
  show do
    render "show"
  end
end
