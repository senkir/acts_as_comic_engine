ActiveAdmin.register Comic do
  index do
    column :name
    #figure out how many pages belong to this comic
    column "Pages" do |comic|
      @count = Page.find_all_by_comic_id(comic.id).count
      if @count == nil
        @count = 0
      end
      link_to @count, admin_pages_path()
    end
    column :updated_at
    column :created_at
  end
end