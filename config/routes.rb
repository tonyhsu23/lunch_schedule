Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users

  resources :events, only: [:index, :new, :create]
  resources :restaurants, only: [:new, :create]
end
