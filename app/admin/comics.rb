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
    column :updated_at
    column :admin_users
    column "New Page" do |comic|
      link_to "New Page", new_admin_page_path(:comic => comic.id)
    end
    column :blog
  end
end
