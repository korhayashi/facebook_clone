Rails.application.routes.draw do
  resources :entries
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
