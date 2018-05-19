Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  post 'login', to: 'users#login'
  get 'login', to: 'users#user_login'
  get 'logout', to: 'users#logout'
  get 'activity', to: 'store#activity'

  resources :orders
  resources :line_items
  resources :products do
    collection do
      get :suggestion_product
    end      
  end
  resources :carts, only: [:create, :show, :destroy]
  resources :categories

  root to: 'store#index'
end
