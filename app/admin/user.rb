ActiveAdmin.register User do
  config.batch_actions = false
  filter :name
  filter :email
  permit_params :email, :password, :password_confirmation, :role, :department_id, :name

  index do
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: Hash[User::ROLES.map{|r| [r,r]}], include_blank: false
      f.input :department
    end
    f.actions
  end

  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

end
