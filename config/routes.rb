Rails.application.routes.draw do
  resources :line_items
  root to: 'store#index'
  resources :products
  resources :carts
  resources :categories
end
