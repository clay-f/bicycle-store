Rails.application.routes.draw do
  root to: 'store#index'
  
  resources :bicycles
  resources :categories
end
