Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #resources :users

  get '/signup', to:'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :customers, only:[:index]
  get '/customer_signup', to:'customers#new', as: 'customer_signup'
  post '/customers', to: 'customers#create'
  get '/customer_login', to: 'customers#login', as: 'customer_login'
  get '/cart', to:'customers#show', as: 'cart'
  get '/customer_cart', to: "customers#cart", as: 'add_cart'
  get '/logout', to: 'sessions#destroy'
  resources :users
  get '/home', to: 'users#show', as: 'homepage'
  get '/search', to: 'products#show'
  resources :products
  resources :orders

end
