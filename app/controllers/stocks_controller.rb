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
    respond_to do |format|
      if @stock.save
        format.html { redirect_to '/almacen', notice: 'Stock creado correctamente' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to '/almacen', notice: 'Stock editado correctamente' }
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
    redirect_to '/almacen', notice: 'Stock was successfully destroyed.'
  end

  #Metodos para admin
  def list
    @stocks = Stock.all
  end

  def do_transfer
    store_id = params[:new_transfer][:store_id]
    stock_id = params[:new_transfer][:id]
    store_transfer = params[:new_transfer][:store_transfer]
    quantity_transfer = params[:new_transfer][:quantity_transfer]

    stock_descount = Stock.find(stock_id)
    stock_filter = Stock.where("store_id = ? and product_id = ? and product_variant_id = ?", store_transfer, stock_descount.product_id, stock_descount.product_variant_id).first
    sum = stock_filter.quantity + quantity_transfer.to_i
    stock_filter.quantity = sum
    rest = stock_descount.quantity - quantity_transfer.to_i
    stock_descount.quantity = rest
    stock_filter.save
    stock_descount.save
    redirect_to "/almacenes/" + store_id.to_s + " /stock"
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
