ActiveAdmin.register FrequentQuestion do
  config.batch_actions = false
  config.clear_sidebar_sections!
  permit_params :sn, :question, :answer, :published

  index do
    id_column
    column :sn
    column :published
    column :question do |resource|
      truncate(resource.question, length: 17)
    end
    actions
  end

  form do |f|
    inputs do
      input :sn
      input :published
      input :question
      input :answer
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :sn
      row :published
      row :question do
        simple_format resource.question
      end
      row :answer do
        simple_format resource.answer
      end
    end
  end
end