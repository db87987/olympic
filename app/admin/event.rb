ActiveAdmin.register Event do
  config.batch_actions = false
  filter :title
  filter :category
  filter :published
  permit_params :published, :title, :category_id, :start_date, :end_date,
                :info_activated, :info_text,
                :tasks_activated, :tasks_text, :user_id,
                :events_activated, :events_text, subject_ids: [],
                events_files_attributes: [:id, :title, :file, :_destroy],
                tasks_files_attributes: [:id, :title, :file, :_destroy],
                info_files_attributes: [:id, :title, :file, :_destroy],
                contacts_attributes: [:id, :firstname, :lastname, :middlename, :position,
                                      :organization, :phone1, :phone2, :email, :photo, :_destroy]

  index do
    column :title
    column :category
    column "Даты" do |event|
      "#{event.start_date} – #{event.end_date}"
    end
    column :user
    column :published
    actions
  end

  form do |f|


    f.inputs do
      if current_user.role == 'admin'
        input :user
      end
      input :published
      input :title
      input :category
      input :subject_ids, as: :select2_multiple, collection: Subject.all
      input :start_date, as: :datepicker
      input :end_date, as: :datepicker
      h2 "Информация"
      input :info_activated, label: "Отобразить вкладку 'Информация'"
      input :info_text, as: :ckeditor, label: false
      f.has_many :info_files, heading: 'Файлы', allow_destroy: true, new_record: true do |a|
        a.input :title
        a.input :file
      end
      h2 "Задания и ответы"
      input :tasks_activated, label: "Отобразить вкладку 'Задания и ответы'"
      input :tasks_text, as: :ckeditor, label: false
      f.has_many :tasks_files, heading: 'Файлы', allow_destroy: true, new_record: true do |a|
        a.input :title
        a.input :file
      end
      h2 "События и итоги"
      input :events_activated, label: "Отобразить вкладку 'События и итоги'"
      input :events_text, as: :ckeditor, label: false
      f.has_many :events_files, heading: 'Файлы', allow_destroy: true, new_record: true do |a|
        a.input :title
        a.input :file
      end
      f.has_many :contacts, heading: 'Контакты', allow_destroy: true, new_record: true do |a|
        a.input :firstname
        a.input :lastname
        a.input :middlename
        a.input :position
        a.input :organization
        a.input :phone1
        a.input :phone2
        a.input :email
        a.input :photo
      end
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :title
      row :user
      row :created_at
      row :subjects do
        resource.subjects.pluck(:title).join(', ')
      end
    end
    panel 'Информация' do
      table_for resource do
        column :info_text do
          simple_format resource.info_text
        end
      end
    end
    panel "Контакты" do
      table_for resource.contacts do
        column :firstname
        column :lastname
        column :middlename
        column :phone1
        column :phone2
      end
    end
  end

  before_create do |record|
    unless record.user_id
      record.user_id = current_user.id
    end
  end
end
