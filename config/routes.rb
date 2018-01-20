Rails.application.routes.draw do
  root to: 'store#index'
  
  resources :products
  resources :categories
end
