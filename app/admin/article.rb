ActiveAdmin.register Article do
  config.batch_actions = false
  filter :title
  filter :date
  filter :category
  permit_params :title, :category_id, :date, :text, :image, :user_id

  index do
    column :title
    column :category
    column :date
    actions
  end

  form do |f|
    inputs do
      if current_user.role == 'admin'
        input :user
      end
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

  before_create do |record|
    unless record.user_id
      record.user_id = current_user.id
    end
  end
end