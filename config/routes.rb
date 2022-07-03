Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  root to: "products#index"
  resources :products do
    resources :orders, only: [:index, :create]
    end
  end
