ActiveAdmin.register SiteQuestion do
  actions :all, except: [:edit, :update, :create, :new]
  config.batch_actions = false
  config.clear_sidebar_sections!

  index do
    id_column
    column :name
    column :email
    column :question do |resource|
      truncate(resource.question, length: 17)
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :name
      row :email
      row :question do
        simple_format resource.question
      end
    end
  end
end
