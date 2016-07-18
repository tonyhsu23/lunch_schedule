Rails.application.routes.draw do
  root to: 'dashboard#index'
  devise_for :users

  resources :events, only: [:index, :show, :new, :create]
  resources :restaurants, only: [:index, :show, :create]
  resources :dishes, only: [:create]

  get '/get_rest_dishes', to: 'events#get_rest_dishes'
end
