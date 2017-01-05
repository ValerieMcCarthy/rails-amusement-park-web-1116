Rails.application.routes.draw do
  resources :users, :rides, :attractions, :sessions
  get '/signin', to:"sessions#new", as: "signin"
  get '/', to: 'application#index', as: 'root'
  get '/logout', to: 'sessions#destroy', as: 'logout'

end