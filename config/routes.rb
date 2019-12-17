Rails.application.routes.draw do
  resources :entries, except: [:new, :show] do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
    collection do
      post :confirm
    end
  end
end
