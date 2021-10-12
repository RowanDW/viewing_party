Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  # get "/", to: "welcome#index"
  resources :users, only: [:new,:create]
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'
  get '/dashboard', to: 'dashboard#index'
  get '/discover', to: 'discover#index'
  resources :movies, only: [:index,:show]
  resources :parties, only: [:new,:create]
end
