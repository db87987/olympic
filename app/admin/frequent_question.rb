ActiveAdmin.register FrequentQuestion do
  config.batch_actions = false
  filter :published
  permit_params :sn, :question, :answer, :published, :user_id

  index do
    column :sn
    column :published
    column :question do |resource|
      truncate(resource.question, length: 17)
    end
    actions
  end

  form do |f|
    inputs do
      if current_user.role == 'admin'
        input :user
      end
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

  before_create do |record|
    unless record.user_id
      record.user_id = current_user.id
    end
  end
end