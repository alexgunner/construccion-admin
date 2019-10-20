Rails.application.routes.draw do
  resources :abouts
  resources :industries
  resources :training_categories
  resources :carousels
  resources :trainings
  resources :offices
  resources :sold_products
  resources :banks
  resources :deliveries
  resources :destinations
  resources :stocks
  resources :extras
  resources :clients
  resources :contacts
  devise_for :users


  root 'site#index'

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

#Admin Routes
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
get '/messages' => 'dashboard#messages'
post '/post_message' => 'dashboard#post_message'
get '/providers_list' => 'site#providers_list'
get '/admin_product_search' => 'products#search'
get '/industrias' => 'industries#list'
get '/stocks/new/:id_product/:id_variant' => 'stocks#new'
get '/stocks/:id/edit/:id_product/:id_variant' => 'stocks#edit'

#Method for deserializable not found or not working
get '/product-variants' => 'product_variants#index'
get '/product-variants/:id' => 'product_variants#show'
post '/users' => 'users#create'
get '/ordenes/:id/edit' => 'orders#edit'
patch '/ordenes/:id' => 'orders#update'
get '/users' => 'users#index'
get '/users/:id' => 'users#show'
get '/usuarios/:id/contacto' => 'users#contact'
post '/users/do_contact' => 'users#do_contact'
get '/training' => 'trainings#training'
get '/carousel_list' => 'carousels#carousel_list'

#Site Routes
get '/category_products/:id' => 'site#category_products'
get '/subcategory_products/:id' => 'site#subcategory_products'
get '/manufacturer_products/:id' => 'site#manufacturer_products'
get '/product_details/:id' => 'site#product_details'
get '/dashboard' => 'dashboard#index'
get '/about_us' => 'site#about_us'
get '/product_categories' => 'site#product_categories'
get '/product_subcategories' => 'site#product_subcategories'
get '/product_offers' => 'site#product_offers'
get '/services' => 'site#services'
get '/contact' => 'site#contact'
get '/offices_list' => 'site#offices_list'
get '/training_list' => 'site#training_list'
get '/cart/:id' => 'carts#carrito'
post '/cart/do_quantity' => 'carts#do_quantity'
get '/orders/new/:id' => 'orders#new'
get '/confirm/:id' => 'orders#confirm'
post '/order/do_file' => 'orders#do_file'
get '/history/:id' => 'orders#history'
get '/users/:id/edit' => 'users#edit'
post '/users/do_edit' => 'users#do_edit'
post '/search' => 'site#search'
end