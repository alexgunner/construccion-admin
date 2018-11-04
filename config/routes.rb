Rails.application.routes.draw do
  resources :deliveries
  resources :destinations
  resources :transports
  resources :stocks
  resources :stores
  resources :extras
  resources :clients
  resources :contacts
  devise_for :users,  path: 'api/users', controllers: { sessions: "api/users/sessions", registrations: "api/users/registrations" }


  root 'products#list'

  resources :products
  resources :product_variants
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
get '/almacenes/:store_id/stock/:id/transferencia' => 'stocks#transfer'
post '/stock/do_transfer' => 'stocks#do_transfer'
get '/usuarios' => 'users#list'
get '/usuarios/:id/habilitar' => 'users#enable'
post '/users/do_enable' => 'users#do_enable'
delete '/usuarios/:id' => 'users#destroy'
get '/transportes' => 'transports#list'
get '/destinos' => 'destinations#list'
get '/envios' => 'deliveries#list'
get '/ordenes' => 'orders#list'
get '/reportes/clientes' => 'clients#reports'
get '/reportes/productos' => 'orders#reports'
#Method for deserializable not found or not working
get '/product-variants' => 'product_variants#index'
post '/users' => 'users#create'
end
