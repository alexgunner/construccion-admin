class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  def index
    @stocks = Stock.all
    render json: @stocks
  end

  # GET /stocks/1
  def show
    render json: @stock
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  def create
    @stock = Stock.new(stock_params)
    if !stock_exist(@stock)
      product_variant = ProductVariant.find(@stock.product_variant_id)
      product_variant.available = true
      product_variant.save
      respond_to do |format|
        if @stock.save
          format.html { redirect_to '/almacen' }
          format.json { render :show, status: :created, location: @stock }
        else
          format.html { render :new }
          format.json { render json: @stock.errors, status: :unprocessable_entity }
        end
      end
    else
       flash[:notice] = "El producto que intentas crear ya existe en stock."
       redirect_back fallback_location: root_path
    end
  end

  # PATCH/PUT /stocks/1
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to '/almacen' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  def destroy
    @stock.destroy
    redirect_to '/almacen'
  end

  #Metodos para admin
  def list
    @stocks = Stock.search(params[:search])
  end

  def stock_exist(stock)
    stocks = Stock.all
    stocks.each do |s|
      if s.product_variant_id == stock.product_variant_id
        return true
      end
    end
    return false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stock_params
      params.require(:stock).permit(:product_id, :product_variant_id, :quantity, :limit)
    end
end
