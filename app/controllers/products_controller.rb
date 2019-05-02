class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "dashboard"
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    render json: @products
  end

  # GET /products/1
  # GET /products/1.json
  def show
    render json: @product
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to '/productos', notice: 'Producto creado correctamente' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to '/productos', notice: 'Producto editado correctamente' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.product_variants.each do |variant|
      variant.destroy
    end
    @product.destroy
    redirect_to '/productos', notice: 'Producto eliminado correctamente'
  end

  #Metodos para las vistas
  def list
    if params[:search_subcategory] != "Todas" and !params[:search_subcategory].blank? and params[:search].blank? and params[:search_category] == "Todas"
      @products = Product.search_subcategory(params[:search_subcategory])
    end 
    if params[:search_category] != "Todas" and !params[:search_category].blank? and params[:search].blank? and params[:search_subcategory] == "Todas"
      @products = Product.search_category(params[:search_category])
    end
    if params[:search].blank? and (params[:search_category] == "Todas" or params[:search_category].blank?) and (params[:search_subcategory] == "Todas" or params[:search_subcategory].blank?)
      @products = Product.search(params[:search])
    end
    if params[:search_category] == "Todas" and params[:search_subcategory] == "Todas"
      @products = Product.search(params[:search])
    end
    #compuesto cat y subcat
    if params[:search_category] != "Todas" and !params[:search_category].blank? and !params[:search_subcategory].blank? and params[:search_subcategory] != "Todas" and params[:search].blank?
      @products = Product.search_category_subcategory(params[:search_category], params[:search_subcategory])
    end
    #compuesto cat, subcat y nombre
    if params[:search_category] != "Todas" and !params[:search_category].blank? and !params[:search_subcategory].blank? and params[:search_subcategory] != "Todas" and  !params[:search].blank?
      @products = Product.search(params[:search])
    end
   
  end

  def search
    search_name = params[:name].to_s
		search_name = search_name.downcase
		@products = []
		Product.all.each do |product|
			if product.name.downcase.include? search_name or product.description.downcase.include? search_name or product.subcategory.name.downcase.include? search_name or product.manufacturer.name.downcase.include? search_name
				@products.push product
			end
		end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:code, :name, :description, :measure_id, :provider_id, :manufacturer_id, :category_id, :subcategory_id, :picture, :offer, :details,
      :picture2, :picture3, :picture4, :industry_id)
    end
end
