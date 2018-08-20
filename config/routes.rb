Rails.application.routes.draw do
  resources :extras
  resources :clients
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

get '/productos' => 'products#list'
get '/unidades' => 'measures#list'
get '/fabricantes' =>'manufacturers#list'
get '/proveedores' =>'providers#list'
get '/categorias' => 'categories#list'
get '/subcategorias' => 'subcategories#list'
get '/contacto' => 'contacts#list'
get '/extra' => 'extras#list'
end
