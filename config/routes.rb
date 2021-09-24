Rails.application.routes.draw do
  root to: "tasks#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :tasks, :users, only: [:index, :show, :create, :new, :edit, :destroy, :update]
  
  post "login", to: "sessions#new"
  resources :tasks, :users, only: [:index, :show, :create, :new, :edit, :destroy, :update]
  
  delete "logout", to: "users#destroy"
  resources :tasks, :users, only: [:index, :show, :create, :new, :edit, :destroy, :update]
  
end