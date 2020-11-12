Rails.application.routes.draw do
  devise_for :users
  
  root to: 'thoughts#index'
    resources :thoughts, only: [ :index, :new, :create, :show]
    resources :users, only: [:show]
end
