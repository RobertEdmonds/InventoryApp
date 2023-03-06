Rails.application.routes.draw do
  resources :rented_samples
  resources :pictures, only: [:index, :create, :destroy]
  resources :samples, only: [:create, :index, :destroy, :update, :show]
  resources :products, only: [:create, :index, :destroy, :update, :show]
  resources :orders
  # resources :employees
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
