Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  get '/', to: 'users#new', as: 'signup'
  get '/home', to: 'users#show', as: 'homepage'
  get '/search', to: 'products#show'
  resources :products
end
