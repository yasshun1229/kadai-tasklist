Rails.application.routes.draw do
  root to: "tasks#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users
  
  post "login", to: "sessions#new"
  resources :tasks, :users
  
  resources :tasks, only: [:show, :new, :edit, :update, :destroy, :create] # 変
end