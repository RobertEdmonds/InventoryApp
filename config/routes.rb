Rails.application.routes.draw do
  resources :rented_samples
  resources :pictures, only: [:index, :create, :destroy]
  resources :samples
  resources :products
  resources :orders
  # resources :employees
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/signup', to: 'employees#create'
  get '/me', to: 'employees#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to: "sessions#destroy"
  # Defines the root path route ("/")
  # root "articles#index"
end
