Rails.application.routes.draw do
  resources :users, only: [:create]
  root 'application#hello'
  get 'login', to: 'sessions#new', as: "login"
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new', as: "signup"

  resources :reviews
  resources :architectures
  resources :artists
  resources :cities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
