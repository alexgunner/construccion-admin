class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

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
      redirect_to '/destinos', notice: 'Destination was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /destinations/1
  def update
    if @destination.update(destination_params)
      redirect_to '/destinos', notice: 'Destination was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /destinations/1
  def destroy
    @destination.destroy
    redirect_to '/destinos', notice: 'Destination was successfully destroyed.'
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
