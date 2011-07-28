ActiveAdmin.register Avatar do
  #menu :parent => "Users"
  menu false
  index do
    column "Image" do |avatar|
      image_tag avatar.image.resized.url
    end
    default_actions
  end
  form :partial => "form"
  
  show do
    render "show"
  end
end
