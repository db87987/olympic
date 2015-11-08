ActiveAdmin.register Survey do
  config.batch_actions = false
  config.clear_sidebar_sections!
  permit_params :title, :question, :start_date, :end_date,
                :show, survey_options_attributes: [:id, :text, :_destroy]

  index do
    id_column
    column :title
    column :question
    column :created_at
    actions
  end

  form do |f|
    inputs do
      input :title
      input :question
      input :start_date, as: :datepicker
      input :end_date, as: :datepicker
      input :show
      f.has_many :survey_options, heading: 'Варианты ответов', allow_destroy: true, new_record: true do |a|
        a.input :text
      end
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :title
      row :question
      row :start_date
    end
    panel "Варианты ответа" do
      table_for resource.survey_options do
        column '' do |so|
           so.id
         end
        column '' do |so|
          so.text
        end
      end
    end
  end
end
