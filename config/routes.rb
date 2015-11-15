Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :articles, only: [:index, :show]
  resources :documents, only: [:index]
  root 'home#index'
end
