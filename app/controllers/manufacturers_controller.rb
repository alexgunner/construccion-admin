class ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_admin!
  layout "dashboard"
  # GET /manufacturers
  # GET /manufacturers.json
  def index
    @manufacturers = Manufacturer.all
    render json: @manufacturers
  end

  # GET /manufacturers/1
  # GET /manufacturers/1.json
  def show
    render json: @manufacturer
  end

  # GET /manufacturers/new
  def new
    @manufacturer = Manufacturer.new
  end

  # GET /manufacturers/1/edit
  def edit
  end

  # POST /manufacturers
  # POST /manufacturers.json
  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    respond_to do |format|
      if @manufacturer.save
        format.html { redirect_to '/fabricantes', notice: 'Fabricante creado correctamente' }
        format.json { render :show, status: :created, location: @manufacturer }
      else
        format.html { render :new }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manufacturers/1
  # PATCH/PUT /manufacturers/1.json
  def update
    respond_to do |format|
      if @manufacturer.update(manufacturer_params)
        format.html { redirect_to '/fabricantes', notice: 'Fabricante editado correctamente' }
        format.json { render :show, status: :ok, location: @manufacturer }
      else
        format.html { render :edit }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manufacturers/1
  # DELETE /manufacturers/1.json
  def destroy
    if @manufacturer.products.blank? or @manufacturer.products.nil? 
      @manufacturer.destroy
      respond_to do |format|
        format.html { redirect_to '/fabricantes', notice: 'Fabricante eliminado correctamente' }
        format.json { head :no_content }
      end
    else
      redirect_to '/fabricantes'
      flash[:alert] = "No puedes borrar a un fabricante que tenga asignados productos. 
                        Por favor primero deja a este fabricante sin relación de productos, antes de eliminarlo."
    end
  end

  #Metodos para admin
  def list
    @manufacturers = Manufacturer.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manufacturer
      @manufacturer = Manufacturer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manufacturer_params
      params.require(:manufacturer).permit(:name, :description, :address, :country, :city, :email, :phone)
    end
end
