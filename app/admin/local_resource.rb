ActiveAdmin.register LocalResource do
  config.batch_actions = false
  filter :title
  permit_params :title, :url, :image

  index do
    id_column
    column :title
    column :url do |resource|
      link_to resource.url, resource.url
    end
    column :created_at
    actions
  end

  form do |f|
    inputs do
      input :title
      input :url
      input :image, as: :file
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :title
      row :url
      row :image do
        image_tag resource.image.url(:icon)
      end
      row :image do
        image_tag resource.image.url(:front)
      end
    end
  end
end
