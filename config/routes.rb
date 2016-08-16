Rails.application.routes.draw do
  root to: 'landing#index'
  devise_for :users, skip: :registration

  resources :dashboard, only: [:index]
  resources :events, only: [:index, :show, :new, :create]
  resources :restaurants, only: [:index, :show, :create]
  resources :dishes, only: [:create]

  get '/company/events', to: 'events#company_index'
  get '/get_rest_dishes', to: 'events#get_rest_dishes'
end
