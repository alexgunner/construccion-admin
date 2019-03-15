class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  # GET /carts
  def index
    @carts = Cart.all
    render json: @carts
  end

  # GET /carts/1
  def show
    render json: @cart
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to '/cart/'+ @cart.user_id.to_s, notice: 'Producto creado correctamente' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Cart was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
    redirect_to '/cart/'+ @cart.user_id.to_s, notice: 'Cart was successfully destroyed.'
  end

  def count
    return Cart.all.count
  end

  #Metodos para admin
  def reports
    SoldProduct.find_each(&:destroy)
    carts = Cart.where('state = true')
    order_id = 0
    order_id = Cart.first.order.id
    carts.each do |cart|
      total_price = (price_product(cart.id)*cart.quantity)
      if SoldProduct.count == 0
        SoldProduct.create(product_variant_id: cart.product_variant.id, quantity: cart.quantity, total: total_price, total_sold: 1)
      else
          if product_exist(cart.product_variant_id)
            sold_product = SoldProduct.where(product_variant_id: cart.product_variant_id).first
            sold_product.quantity = sold_product.quantity + cart.quantity
            sold_product.total = sold_product.total + total_price
            if order_id != cart.order.id
              sold_product.total_sold = sold_product.total_sold + 1
            end
            order_id = cart.order.id
            sold_product.save
          else
            SoldProduct.create(product_variant_id: cart.product_variant.id, quantity: cart.quantity, total: total_price, total_sold: 1)
          end
      end
    end
    if params[:search].nil?
      if params[:ordenar].nil? or params[:ordenar] == "Todos"
        @solds = SoldProduct.all
      else
        @solds = SoldProduct.ordenar(params[:ordenar])
      end
    else
      @solds = SoldProduct.search(params[:search])
    end
    render :layout => "dashboard"
  end

  def product_exist(id)
    sold_products = SoldProduct.all
    answer = false
    sold_products.each do |sold|
      if(id == sold.product_variant_id)
        answer = true
      end
    end
    return answer
  end

  def price_product(id)
    cart = Cart.find(id)
    total = cart.product_variant.price
    if cart.product_variant.offerprice.nil?
      if cart.role == "Mayorista "
        total = cart.product_variant.wholesaleprice
      end
      if cart.role == "Especialista "
        total = cart.product_variant.specialistprice
      end
      if cart.role == "Cliente DOMUS "
        total = cart.product_variant.importerprice
      end
    else
      total = cart.product_variant.offerprice
    end
    return total
  end

  def show_details_report
    @product_variant = ProductVariant.find(params[:id])
    @total_minoristas = @product_variant.carts.where("role = ?", "Cliente Minorista ").sum("quantity")
    @total_domus = @product_variant.carts.where("role = ?", "Cliente DOMUS ").sum("quantity")
    @total_especialitas = @product_variant.carts.where("role = ?", "Especialista ").sum("quantity")
    @total_mayoristas = @product_variant.carts.where("role = ?", "Mayorista ").sum("quantity")
  end

  def carrito
    @carts = Cart.where('user_id = ? and state = false', params[:id])
  end

  def do_quantity
    cart = Cart.find(params[:do_quantity][:id])
    cart.quantity = params[:do_quantity][:quantity]
    cart.save
    redirect_to "/cart/"+cart.user_id.to_s
  end

  def destroy_them_all
    Cart.destroy_all
    redirect_to articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
       params.require(:cart).permit(:quantity, :order_id, :product_variant_id, :role, :user_id, :state)
    end
end
