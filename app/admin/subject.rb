ActiveAdmin.register Subject do
  config.batch_actions = false
  filter :title
  permit_params :title

  index do
    column :title
    actions
  end

  form do |f|
    inputs do
      input :title
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :title
    end
  end
end
