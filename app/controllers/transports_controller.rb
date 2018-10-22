class TransportsController < ApplicationController
  before_action :set_transport, only: [:show, :edit, :update, :destroy]

  # GET /transports
  def index
    @transports = Transport.all
    render json: @transports
  end

  # GET /transports/1
  def show
  end

  # GET /transports/new
  def new
    @transport = Transport.new
  end

  # GET /transports/1/edit
  def edit
  end

  # POST /transports
  def create
    @transport = Transport.new(transport_params)

    if @transport.save
      redirect_to '/transportes', notice: 'Transport was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /transports/1
  def update
    if @transport.update(transport_params)
      redirect_to '/transportes', notice: 'Transport was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /transports/1
  def destroy
    @transport.destroy
    redirect_to '/transportes', notice: 'Transport was successfully destroyed.'
  end

  def list
    @transports = Transport.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transport
      @transport = Transport.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transport_params
      params.require(:transport).permit(:name)
    end
end
