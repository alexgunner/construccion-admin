class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_admin!
  layout "dashboard"
  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.all
    render json: @providers
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
    render json: @provider
  end

  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to '/proveedores', notice: 'Provedor creado correctamente' }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to '/proveedores', notice: 'Provedor editado correctamente' }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    if @provider.products.blank? or @provider.products.nil? 
      @provider.destroy
      respond_to do |format|
        format.html { redirect_to '/proveedores', notice: 'Provedor eliminado correctamente' }
        format.json { head :no_content }
      end
    else
      redirect_to '/proveedores'
      flash[:alert] = "No puedes borrar a un proveedor que tenga asignados productos. 
                        Por favor primero deja a este proveedor sin relación de productos, antes de eliminarlo."
    end
  end

  #Metodos para admin
  def list
    @providers = Provider.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:name, :description, :email, :phone, :address, :country, :city, :cover, :website_link)
    end
end
