Rails.application.routes.draw do
  resources :offices
  resources :sold_products
  resources :banks
  resources :deliveries
  resources :destinations
  resources :stocks
  resources :extras, :defaults => { :format => :json }
  resources :clients
  resources :contacts, :defaults => { :format => :json }
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
  resources :password_resets

get 'password_resets/new'
post '/total' => 'orders#calculateTotal'
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
get '/almacen' => 'stocks#list'
get '/usuarios' => 'users#list'
get '/usuarios/:id/habilitar' => 'users#enable'
post '/users/do_enable' => 'users#do_enable'
delete '/usuarios/:id' => 'users#destroy'
get '/usuarios/:id/bloquear' => 'users#bloq'
get '/usuarios/:id/desbloquear' => 'users#desbloq'
get '/transportes' => 'transports#list'
get '/destinos' => 'destinations#list'
get '/envios' => 'deliveries#list'
get '/ordenes' => 'orders#list'
get '/ordenes/:id/editar' => 'orders#change'
post '/orders/do_change' => 'orders#do_change'
get '/reportes/productos_vendidos' => 'carts#reports'
get '/reportes/productos_stock' => 'stocks#reports'
get '/reportes/productos_vendidos/:id' => 'carts#show_details_report'
get '/reportes/clientes' => 'clients#reports'
get '/reportes/productos' => 'product_variants#reports'
get '/reportes/ordenes_comparativa' => 'orders#reports'
get '/reportes/ordenes' => 'orders#reports_list'
get '/reportes/ordenes/:id' => 'orders#show_order'
get '/bancos' => 'banks#list'
get '/usuario/:id' => 'users#showuser'
get '/sucursales' => 'offices#list'
#Method for deserializable not found or not working
get '/product-variants' => 'product_variants#index'
get '/product-variants/:id' => 'product_variants#show'
post '/users' => 'users#create'
get '/ordenes/:id/edit' => 'orders#edit'
patch '/ordenes/:id' => 'orders#update'
get '/users' => 'users#index'
get '/users/:id' => 'users#show'
patch '/users/:id' => 'users#update'
get '/usuarios/:id/contacto' => 'users#contact'
post '/users/do_contact' => 'users#do_contact'
end
