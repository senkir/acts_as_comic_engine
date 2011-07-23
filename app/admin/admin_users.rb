ActiveAdmin.register AdminUser do
  menu :label => "Users"
  index do
    column :email
    column :is_admin
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column "Avatar" do |user|
      if user.avatar != nil
        link_to image_tag(user.avatar.image.thumb.url), admin_avatar_path(user.id)
      end
    end
    default_actions
  end
  
  show do
    render "show"
  end
  
  form :partial => "form"
  
  
end
