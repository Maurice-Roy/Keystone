Rails.application.routes.draw do
  resources :reviews
  resources :users
  resources :architectures
  resources :artists
  resources :cities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
