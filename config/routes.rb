Rails.application.routes.draw do
  devise_for :users
  resources :carts
  resources :photos
  resources :users
  root 'photos#index'
  post 'add_to_cart', to: 'carts#add_to_cart', as: 'add_to_cart'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
