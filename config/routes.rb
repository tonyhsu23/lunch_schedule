Rails.application.routes.draw do
  root to: 'dashboard#index'
  devise_for :users

  resources :events, only: [:index, :show, :new, :create]
  resources :restaurants, only: [:index, :show, :new, :create]
  resources :dishes, only: [:new, :create]
end
