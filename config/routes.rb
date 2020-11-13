Rails.application.routes.draw do
  devise_for :users
  
  root to: 'thoughts#index'
    resources :thoughts do
      resources :comments, only: :create
    end
    resources :users, only: [:show]
end
