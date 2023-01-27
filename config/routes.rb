Rails.application.routes.draw do
  resources :rented_samples
  resources :pictures
  resources :samples, only: [:create, :index, :destroy, :update, :show]
  resources :products, only: [:create, :index, :destroy, :update, :show]
  resources :orders, only: [:create, :index, :destroy, :update, :show]
  # resources :employees
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
