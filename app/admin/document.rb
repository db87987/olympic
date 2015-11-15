ActiveAdmin.register Document do
  config.batch_actions = false
  filter :title
  filter :document_type_id
  permit_params :title, :category_id, :text, :document_file

  index do
    column :title
    column :category
    column :created_at
    actions
  end

  form do |f|
    inputs do
      input :title
      input :category
      input :text
      input :document_file, as: :file
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :title
      row :category
      row :text do
        simple_format resource.text
      end
      row :document_file do
        link_to resource.document_file_file_name, resource.document_file.url
      end
    end
  end
end
