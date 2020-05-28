class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]
#  #before_action :authenticate_admin!
  layout "dashboard"
  # GET /destinations
  def index
    @destinations = Destination.all
    render json: @destinations
  end

  # GET /destinations/1
  def show
    render json: @destination
  end

  # GET /destinations/new
  def new
    @destination = Destination.new
  end

  # GET /destinations/1/edit
  def edit
  end

  # POST /destinations
  def create
    @destination = Destination.new(destination_params)

    if @destination.save
      redirect_to '/destinos', notice: 'Destino creado correctamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /destinations/1
  def update
    if @destination.update(destination_params)
      redirect_to '/destinos', notice: 'Destino editado correctamente.'
    else
      render :edit
    end
  end

  # DELETE /destinations/1
  def destroy
    if @destination.deliveries.blank? or @destination.deliveries.nil? 
      @destination.destroy
      redirect_to '/destinos', notice: 'Destino eliminado correctamente.'
    else
      redirect_to '/destinos'
      flash[:alert] = "No puedes borrar a un destino que tenga asignados deliveries. 
                        Por favor primero deja a este  destino sin relación de deliveries, antes de eliminarlo."
    end
  end

  def list
    @destinations = Destination.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @destination = Destination.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def destination_params
      params.require(:destination).permit(:name, :city, :country, :cash)
    end
end
