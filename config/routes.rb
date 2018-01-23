Rails.application.routes.draw do
  resources :users
  resources :orders
  resources :line_items
  root to: 'store#index'
  resources :products
  resources :carts
  resources :categories
end
