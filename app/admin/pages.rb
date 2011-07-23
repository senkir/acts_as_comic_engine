ActiveAdmin.register Page do
  menu :parent => "Comics"
  
  before_filter do
    @page = nil
    if params[:comic] != nil
      @page = Comic.find(params[:comic]).new_page
    end
  end
  
  filter :comic
  filter :title
  filter :sequence
  filter :updated_at
  
  scope :all, :default => true
  scope :visible
  scope :invisible
  #scoping by comic wasn't working...'
  # Comic.all.each do |comic|
  #   scope (Page.by_comic comic.id)
  # end
  
  #listview
  index do
    column "Visible" do |page|
      if page.is_shown == true
        "YES"
      else
        "NO"
      end
    end
    column :title
    column "preview" do |preview|
      image_tag(preview.image.thumb.url)
    end
    column "comic" do |page|
      page.comic.title
    end
    column :sequence
    column :updated_at
    default_actions
  end
  
  #edit
  form :partial => "form", :locals => {:page => @page}
  
  #show
  show do
    render "show"
  end
end
