Rails.application.routes.draw do
  root 'application#hello'
  get 'login', to: 'sessions#new', as: "login"
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:create]
  get 'signup', to: 'users#new', as: "signup"
  get 'analytics', to: 'users#analytics', as: "analytics"

  resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  resources :architectures
  resources :artists
  resources :styles
  resources :cities
end
