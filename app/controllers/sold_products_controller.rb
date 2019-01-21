class SoldProductsController < ApplicationController
  before_action :set_sold_product, only: [:show, :edit, :update, :destroy]

  # GET /sold_products
  def index
    @sold_products = SoldProduct.all
  end

  # GET /sold_products/1
  def show
  end

  # GET /sold_products/new
  def new
    @sold_product = SoldProduct.new
  end

  # GET /sold_products/1/edit
  def edit
  end

  # POST /sold_products
  def create
    @sold_product = SoldProduct.new(sold_product_params)

    if @sold_product.save
      redirect_to @sold_product, notice: 'Sold product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sold_products/1
  def update
    if @sold_product.update(sold_product_params)
      redirect_to @sold_product, notice: 'Sold product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sold_products/1
  def destroy
    @sold_product.destroy
    redirect_to sold_products_url, notice: 'Sold product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sold_product
      @sold_product = SoldProduct.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sold_product_params
      params.require(:sold_product).permit(:product_variant_id, :quantity)
    end
end
