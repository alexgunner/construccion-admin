class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
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
    render :layout => "application"
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
      if client_data.nameinvoice.blank?
        @client.nameinvoice = "Sin Nombre"
      else
        @client.nameinvoice = client_data.nameinvoice
      end
      if client_data.nit.blank?
        @client.nit = 0
      else
        @client.nit = client_data.nit
      end
      @client.role = client_data.role
      @client.increment(:count,1)
    else
      @client.count = 1
    end
    respond_to do |format|
      if @client.save
        format.html { redirect_to '/orders/new/' + @client.id.to_s, notice: 'Producto creado correctamente' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
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
    @clients = Client.search(params[:search])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:name, :address, :phone, :mail, :ci, :count, :nit, :nameinvoice, :cellphone, :cellwsp, :role, :destination_id)
    end
end
