ActiveAdmin.register Category do
  config.batch_actions = false
  filter :title
  permit_params :title, :department_id

  index do
    column :title
    column :department
    column :created_at
    actions
  end

  form do |f|
    inputs do
      input :title
      input :department
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :title
      row :department
      row :created_at
    end
  end
end
