Rails.application.routes.draw do
  root 'main#index'

  resources :products
  resources :manufacturers
  resources :providers
  resources :subcategories
  resources :categories
  resources :measures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
