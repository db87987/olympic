ActiveAdmin.register Article do
  config.batch_actions = false
  filter :title
  filter :date
  permit_params :title, :category_id, :date, :text, :image

  index do
    id_column
    column :title
    column :category_id
    column :date
    actions
  end

  form do |f|
    inputs do
      input :title
      input :category
      input :date, as: :datepicker
      input :text
      input :image
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :title
      row :category
      row :image do
        image_tag resource.image.url(:medium)
      end
    end
  end
end