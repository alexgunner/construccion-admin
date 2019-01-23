class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  deserializable_resource :cart, only: [:create, :update]

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
    if @cart.save
      render json: @cart, status: :created
    else
      render json: @cart.errors, status: :unprocessable_entity
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
    redirect_to carts_url, notice: 'Cart was successfully destroyed.'
  end

  def count
    return Cart.all.count
  end

  #Metodos para admin
  def reports
    SoldProduct.find_each(&:destroy)
    carts = Cart.all
    carts.each do |cart|
      if SoldProduct.count == 0
        total_price = price_product(cart.product_variant_id)
        SoldProduct.create(product_variant_id: cart.product_variant.id, quantity: cart.quantity, total: total_price)
      else
          if product_exist(cart.product_variant_id)
            sold_product = SoldProduct.where(product_variant_id: cart.product_variant_id).first
            sold_product.quantity = sold_product.quantity + cart.quantity
            sold_product.total = sold_product.total + price_product(cart.product_variant_id)
            sold_product.save
          else
            total_price = price_product(cart.product_variant_id)
            SoldProduct.create(product_variant_id: cart.product_variant.id, quantity: cart.quantity, total: total_price)
          end
      end
    end
    @solds = SoldProduct.all
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
    # if cart.product_variant.offerprice.nil? or cart.product_variant.offerprice.blank
    #   if cart.role == "Mayorista "
    #     total = cart.product_variant.wholesaleprice
    #   end
    #   if cart.role == "Especialista "
    #     total = cart.product_variant.specialistprice
    #   end
    #   if cart.role == "Cliente DOMUS "
    #     total = cart.product_variant.importerprice
    #   end
    # else
    #   total = cart.product_variant.offerprice
    # end
    return total
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
       params.require(:cart).permit(:quantity, :order_id, :product_variant_id, :role)
    end
end
