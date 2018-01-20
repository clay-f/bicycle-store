Rails.application.routes.draw do
  resources :products
  root to: 'store#index'
  get 'stores', to: 'store#index'
  resources :categories
end
