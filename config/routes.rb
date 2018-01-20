Rails.application.routes.draw do
  get 'store/index'

  root 'bicycles#index'
  resources :bicycles
  resources :categories
end
