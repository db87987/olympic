Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :articles, only: [:index, :show]
  resources :documents, only: [:index]
  resources :local_resources, only: [:index]
  resources :surveys, only: [:index, :show]
  resources :contacts, only: [:index]
  resources :frequent_questions, only: [:index]
  root 'home#index'
end
