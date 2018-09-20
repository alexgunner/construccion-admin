class ProductVariantsController < ApplicationController
  before_action :set_product_variant, only: [:show, :edit, :update, :destroy]

  # GET /product_variants
  def index
    @product_variants = ProductVariant.all
    render json: @product_variants
  end

  # GET /product_variants/1
  def show
  end

  # GET /product_variants/new
  def new
    @product_variant = ProductVariant.new
    @product = Product.find(params[:product_id])
  end

  # GET /product_variants/1/edit
  def edit
    #@product_variant = ProductVariant.find(params[:variant_id])
    @product = Product.find(params[:product_id])
  end

  # POST /product_variants
  def create
    @product_variant = ProductVariant.new(product_variant_params)
    product = Product.find(@product_variant.product_id)
    if @product_variant.offer_price.nil?
      product.set_offer(@product_variant.product_id, false)
    else
      product.set_offer(@product_variant.product_id, true)
    end
    respond_to do |format|
      if @product_variant.save
        format.html { redirect_to '/productos/' + product.id.to_s + '/variantes', notice: 'Producto creado correctamente' }
        format.json { render :show, status: :created, location: @product_variant }
      else
        format.html { render :new }
        format.json { render json: @product_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_variants/1
  def update
    product = Product.find(@product_variant.product_id)
    if @product_variant.offer_price.nil?
      product.set_offer(@product_variant.product_id, false)
    else
      product.set_offer(@product_variant.product_id, true)
    end
    respond_to do |format|
      if @product_variant.update(product_variant_params)
        format.html { redirect_to '/productos/' + product.id.to_s + '/variantes', notice: 'Producto editado correctamente' }
        format.json { render :show, status: :ok, location: @product_variant }
      else
        format.html { render :edit }
        format.json { render json: @product_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_variants/1
  def destroy
    @product_variant.destroy
    redirect_to product_variants_url, notice: 'Product variant was successfully destroyed.'
  end

  #Metodos para admin
  def list
    @product_variants = ProductVariant.where("product_id = ?", params[:product_id])
    @product = Product.find(params[:product_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_variant
      @product_variant = ProductVariant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_variant_params
      params.require(:product_variant).permit(:variant_size, :price, :product_id, :description, :reference_code, :reposition, :reposition_date, :offer, :offer_price)
    end
end
