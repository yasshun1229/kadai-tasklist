Rails.application.routes.draw do
  root to: "tasks#index"
  
  get "signup", to: "users#new"
  resources :tasks, :users, only: [:index, :show, :create, :new, :edit]
end

# 5行目の"tasks"は"users"かもしれん。