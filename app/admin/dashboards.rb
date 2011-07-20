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
  section "My Comics" do
    @comics = Comic.find_all_by_owner_id(current_admin_user.id)
    if @comics == nil
      "no comics"
    else
      ul do
        @comics.each do |comic|
          li comic.title
        end
      end
    end
  end
  
  section "My Blogs" do
    ul do
      Blog.all.each do |blog|
        li blog.title
      end
    end
        
  end
  
  section "Your User Info" do
    ul do
      if current_admin_user.avatar != nil
        li image_tag(current_admin_user.avatar.image.url)
      end
      li "Display Name: " + current_admin_user.displayname
      li "Email: " + current_admin_user.email      
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
