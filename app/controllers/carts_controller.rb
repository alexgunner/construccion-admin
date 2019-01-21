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
    carts = Cart.all
    sold_products = SoldProduct.all
    carts.each do |cart|
      sold_products.each do |sold|
        if SoldProduct.none
          puts "------>nada"
        else
        if(cart.product_variant.id == sold.product_variant.id)
          sold_product = SoldProduct.where(product_variant_id: sold.product_variant.id)
          sold_product.quantity = sold_product.quantity + cart.quantity
        else
          puts "nilloooo"
          #sold_product = SoldProduct.create(product_variant_id: cart.product_variant.id, quantity: cart.quantity)
        end
        sold_product.save
        end
      end
    end
    @solds = SoldProduct.all
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
