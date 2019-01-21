class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  deserializable_resource :client, only: [:create]

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
    client_data = @client
    c = client_exist(@client.ci)
    if c != nil
      @client = Client.find(c.id)
      @client.name = client_data.name
      @client.address = client_data.address
      @client.phone = client_data.phone
      @client.cellphone = client_data.cellphone
      @client.cellwsp = client_data.cellwsp
      @client.nameinvoice = client_data.nameinvoice
      @client.nit = client_data.nit
      @client.increment(:count,1)
    else
      @client.count = 1
    end
    @client.save
    render json: @client
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

  def client_exist(ci)
    clients = Client.all
    clients.each do |c|
      if c.ci == ci
        return c
      end
    end
    return nil
  end

  def reports
    @clients = Client.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:name, :address, :phone, :mail, :ci, :count, :nit, :nameinvoice, :cellphone, :cellwsp)
    end
end
