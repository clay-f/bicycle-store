Rails.application.routes.draw do
  root 'bicycles#index'
  resources :bicycles
  resources :categories
end
