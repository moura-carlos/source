Rails.application.routes.draw do
  # active_admin urls
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # items controller
  resources :items

  # users could sign up multiple times
  resources :users

  # users can only make 1 session
  resource :session

  get 'about', to: 'pages#about'
  root 'pages#home'
end
