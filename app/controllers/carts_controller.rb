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
    render json: @carts
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
      render json: @cart
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
      #params.require(:data).permit(:type, {attributes: [:quantity]}, {relationships: [:product, :order]})
       params.require(:cart).permit(:quantity, :order_id, :product_id)
    end
end
