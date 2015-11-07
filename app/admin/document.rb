ActiveAdmin.register Document do
  permit_params :title, :document_type_id, :text, :document_file

  form do |f|
    inputs 'Details' do
      input :title
      input :document_type_id
      input :text
      input :document_file, as: :file
    end
    actions
  end

  show do |doc|
    attributes_table do
      row :title
      row :document_type_id
      row :text do
        simple_format doc.text
      end
      row :document_file do
        link_to doc.document_file_file_name, doc.document_file.url
      end
    end
  end
end
