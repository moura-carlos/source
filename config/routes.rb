Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # users could sign up multiple times
  resources :users

  # users can only make 1 session
  resource :session

  get 'about', to: 'pages#about'
  root 'pages#home'
end
