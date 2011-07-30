ActiveAdmin.register Comic do
  #Index Page
  index do
    column :title
    #figure out how many pages belong to this comic
    column "Pages" do |comic|
      @count = Page.find_all_by_comic_id(comic.id).count
      if @count == nil
        @count = 0
      end
      link_to @count, admin_pages_path()
    end
    column "New Page" do |comic|
      link_to "New Page", new_admin_page_path(:comic => comic.id)
    end
      column :updated_at
    column "Owner" do |comic|      
      link_to image_tag(comic.owner.avatar.image.thumb.url), admin_admin_user_path(comic.owner.id)
    end
    column "Last Visible Page" do |comic|
      last_visible = comic.last_page
      if last_visible != nil
        link_to image_tag(last_visible.image.thumb.url), admin_page_path(last_visible.id)
      else
        "no image"
      end
    end
    column "Last Uploaded Page" do |comic|
      last_page = comic.pages.last
      if last_page != nil
        link_to image_tag(last_page.image.thumb.url), admin_page_path(last_page.id)
      elsif
        li "no image"
      end
    end
    column "Blog Enabled" do |comic|
      if comic.has_blog
        "yes"
      else
        "no"
      end
    end
    column :blog
    default_actions
  end
    
  show do
    render "show"
  end
  #New / Update
  form :partial => "form", :locals => {:comic => @comic}
    
    #TODO:  need the ability to add contributors to a comic
    def add_contributor
    end
    
    def remove_contributor
    end
end
