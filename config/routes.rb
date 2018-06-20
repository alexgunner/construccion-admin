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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
