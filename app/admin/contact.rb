ActiveAdmin.register Contact do
  config.batch_actions = false
  config.clear_sidebar_sections!
  permit_params :firstname, :lastname, :middlename, :position, :organization,
                :phone1, :phone2, :email, :photo


  index do
    id_column
    column :lastname
    column :firstname
    column :middlename
    column :from_event? do |resource|
      status_tag resource.from_event?
    end
    actions
  end

  form do |f|
    inputs do
      input :firstname
      input :lastname
      input :middlename
      input :position
      input :organization
      input :phone1
      input :phone2
      input :email
      input :photo
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :firstname
      row :lastname
      row :position
      row :organization
      row :phone1
      row :phone2
      row :middlename
      row :email
      row :photo do
        image_tag resource.photo.url(:small)
      end
    end
  end
end