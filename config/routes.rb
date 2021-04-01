Rails.application.routes.draw do
  get 'attended_events/new'
  get 'attended_events/create'
  get 'events/index'
  get 'events/show'
  get 'events/new'
  post 'events/create'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :users, only: [:show, :new, :create, :index]
  get 'login', to: 'sessions#new' 
  post 'login', to: 'sessions#create' 
  delete 'logout', to: 'sessions#destroy'
end
