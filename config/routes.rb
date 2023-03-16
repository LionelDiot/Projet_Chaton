Rails.application.routes.draw do
  devise_for :users
  

  resources :carts, except: [:index, :edit, :new, :create, :update, :destroy]
  resources :photos, except: [:edit, :new,:create, :update, :destroy]
  resources :users, except: [:index, :new, :create, :destroy]
  resources :orders, only: [:show]
  root 'photos#index'
  post 'add_to_cart', to: 'carts#add_to_cart', as: 'add_to_cart'
  post 'delete_photo', to: 'photos#delete_photo', as: 'delete_photo'


  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
