class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  def index
    @stocks = Stock.all
    render json: @stocks
  end

  # GET /stocks/1
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
    @store = Store.find(params[:store_id])
  end

  # GET /stocks/1/edit
  def edit
    @store = Store.find(params[:store_id])
  end

  # POST /stocks
  def create
    @stock = Stock.new(stock_params)
    store = Store.find(@stock.store_id)
    respond_to do |format|
      if @stock.save
        format.html { redirect_to '/almacenes/' + store.id.to_s + '/stock', notice: 'Stock creado correctamente' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  def update
    store = Store.find(@stock.store_id)
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to '/almacenes/' + store.id.to_s + '/stock', notice: 'Stock editado correctamente' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  def destroy
    store = Store.find(@stock.store_id)
    @stock.destroy
    redirect_to '/almacenes/' + store.id.to_s + '/stock', notice: 'Stock was successfully destroyed.'
  end

  #Metodos para admin
  def list
    @stocks = Stock.where("store_id = ?", params[:store_id])
    @store = Store.find(params[:store_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stock_params
      params.require(:stock).permit(:store_id, :product_id, :product_variant_id, :quantity, :limit)
    end
end
