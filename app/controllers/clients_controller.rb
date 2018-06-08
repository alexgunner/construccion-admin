class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  deserializable_resource :client, only: [:create, :update]

  # GET /clients
  def index
    @clients = Client.all
      render json: @clients
  end

  # GET /clients/1
  def show
    render json: @client
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    redirect_to clients_url, notice: 'Client was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:name, :lastName, :address, :phone, :mail, :nit)
    end
end
