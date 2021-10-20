Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  resources :users, only: [:create]
  resources :friendships, only: [:create]

  get '/registration', to: 'users#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#index'
  get '/discover', to: 'discover#index'
  resources :movies, only: [:index,:show]
  resources :parties, only: [:new,:create]
end
