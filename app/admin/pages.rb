ActiveAdmin.register Page do
  menu :parent => "Comics"
  
  index do
    column :title
    column :comic_id
    column :sequence
    
  end
  form :partial => "form"
end
