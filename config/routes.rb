Rails.application.routes.draw do
  resources :clients
  resources :abouts
  resources :contacts
  devise_for :users
  root 'main#index'

  resources :products
  resources :manufacturers
  resources :providers
  resources :subcategories
  resources :categories
  resources :measures
  resources :orders
  resources :carts

get '/pay/:id' => 'orders#pay'

#Rutas para productos admin
get '/productos' => 'products#list'

#Rutas para unidades admin
get '/unidades' => 'measures#list'


end
