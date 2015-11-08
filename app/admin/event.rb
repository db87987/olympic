ActiveAdmin.register Event do
  config.batch_actions = false
  config.clear_sidebar_sections!
  permit_params :published, :title, :category_id, :start_date, :end_date,
                :info_activated, :info_text, :info_file,
                :tasks_activated, :tasks_text, :tasks_file,
                :events_activated, :events_text, :events_file, subject_ids: []

  index do
    id_column
    column :title
    column :category
    column "Даты" do |event|
      "#{event.start_date} – #{event.end_date}"
    end
    actions
  end

  form do |f|


    f.inputs do
      input :published
      input :title
      input :category
      input :subject_ids, as: :select2_multiple, collection: Subject.all
      input :start_date, as: :datepicker
      input :end_date, as: :datepicker
      h2 "Информация"
      input :info_activated, label: "Отобразить вкладку 'Информация'"
      input :info_text
      input :info_file
      h2 "Задания и ответы"
      input :tasks_activated, label: "Отобразить вкладку 'Задания и ответы'"
      input :tasks_text
      input :tasks_file
      h2 "События и итоги"
      input :events_activated, label: "Отобразить вкладку 'События и итоги'"
      input :events_text
      input :events_file
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :title
      row :created_at
      row :subjects do
        resource.subjects.pluck(:title)
      end
    end
  end
end
