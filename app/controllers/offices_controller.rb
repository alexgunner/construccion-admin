class OfficesController < ApplicationController
  before_action :set_office, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "dashboard"
  # GET /offices
  def index
    @offices = Office.all
    render json: @offices
  end

  # GET /offices/1
  def show
    render json: @office
  end

  # GET /offices/new
  def new
    @office = Office.new
  end

  # GET /offices/1/edit
  def edit
  end

  # POST /offices
  def create
    @office = Office.new(office_params)

    if @office.save
      redirect_to '/sucursales', notice: 'Office was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /offices/1
  def update
    if @office.update(office_params)
      redirect_to '/sucursales', notice: 'Office was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /offices/1
  def destroy
    @office.destroy
    redirect_to '/sucursales', notice: 'Office was successfully destroyed.'
  end

  #Metodos para admin
  def list
    @offices = Office.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office
      @office = Office.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def office_params
      params.require(:office).permit(:name, :city, :phone, :cellphone, :cellwsp, :address, :lat, :long, :email, :picture)
    end
end
