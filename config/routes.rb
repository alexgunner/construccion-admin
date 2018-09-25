Rails.application.routes.draw do
  resources :stocks
  resources :stores
  resources :product_variants
  resources :extras
  resources :clients
  resources :contacts
  devise_for :users
  root 'products#list'

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
get '/productos/:product_id/variantes' => 'product_variants#list'
get '/productos/:product_id/product_variants/new' => 'product_variants#new'
get '/productos/:product_id/product_variants/:id/edit' => 'product_variants#edit'
get '/unidades' => 'measures#list'
get '/fabricantes' =>'manufacturers#list'
get '/proveedores' =>'providers#list'
get '/categorias' => 'categories#list'
get '/subcategorias' => 'subcategories#list'
get '/contacto' => 'contacts#list'
get '/extra' => 'extras#list'
get '/almacenes' => 'stores#list'
get '/almacenes/:store_id/stock' => 'stocks#list'
get '/almacenes/:store_id/stock/new' => 'stocks#new'
get '/almacenes/:store_id/stock/:id/edit' => 'stocks#edit'
end
