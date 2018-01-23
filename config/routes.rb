Rails.application.routes.draw do

  post 'login', to: 'users#login'
  get 'login', to: 'users#user_login'
  get 'logout', to: 'users#logout'

  resources :orders
  resources :line_items
  resources :products
  resources :carts
  resources :categories

  root to: 'store#index'
end
