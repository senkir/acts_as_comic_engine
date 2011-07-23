ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end    
  section "My Owned Comics", :priority => 1 do
    table_for Comic.find_all_by_owner_id(current_admin_user.id).each do |comic|
      column :title
      column "Last Visible Page" do |comic|
        last_visible = comic.last_page
        if last_visible != nil
          link_to image_tag(last_visible.image.thumb.url), admin_page_path(last_visible.id)
        elsif
          "no image"
        end
      end
      column "Blog" do |comic|
        link_to comic.blog.title, admin_blog_path(comic.blog.id)
      end      
    end        
  end
  
  section "Comics I contribute to", :priority => 2 do
    table_for current_admin_user.all_contributing_comics.each do |comic|
      column :title
      column "Last Visible Page" do |comic|
        last_visible = comic.last_page
        if last_visible != nil
          link_to image_tag(last_visible.image.thumb.url), admin_page_path(last_visible.id)
        elsif
          "no image"
        end
      end
      column "Blog" do |comic|
        link_to comic.blog.title, admin_blog_path(comic.blog.id)
      end
      column "Owner" do |comic|
        comic.owner.displayname
      end
    end        
  end
  
  section "This is me", :priority => 3 do
    div do
      ul do
        li current_admin_user.displayname
        if current_admin_user.avatar != nil
          li link_to image_tag(current_admin_user.avatar.image.resized.url), edit_admin_avatar_path(current_admin_user.avatar)
        end
        li link_to "Update Profile", edit_admin_admin_user_path(current_admin_user.id)
      end
    end
  end
  
  # == Render Partial Section
  # The block is rendererd within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
#  section "Comic Asset Types", :priority => 5
#  section "Comic Assets", :priority => 3
#  section "Comics", :priority => 1
#  section "Pages", :priority => 2
#  section "Settings", :priority => 4
end
