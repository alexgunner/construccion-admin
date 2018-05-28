Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
