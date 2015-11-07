ActiveAdmin.register Document do
  config.batch_actions = false
  config.clear_sidebar_sections!
  permit_params :title, :document_type_id, :text, :document_file

  index do
    id_column
    column :title
    column :document_type_id
    column :created_at
    actions
  end

  form do |f|
    inputs do
      input :title
      input :document_type_id
      input :text
      input :document_file, as: :file
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :title
      row :document_type_id
      row :text do
        simple_format resource.text
      end
      row :document_file do
        link_to resource.document_file_file_name, resource.document_file.url
      end
    end
  end
end
