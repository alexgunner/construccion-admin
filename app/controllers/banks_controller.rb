class BanksController < ApplicationController
  before_action :set_bank, only: [:show, :edit, :update, :destroy]
#  #before_action :authenticate_admin!
  layout "dashboard"
  # GET /banks
  def index
    @banks = Bank.all
    render json: @banks
  end

  # GET /banks/1
  def show
  end

  # GET /banks/new
  def new
    @bank = Bank.new
  end

  # GET /banks/1/edit
  def edit
  end

  # POST /banks
  def create
    @bank = Bank.new(bank_params)

    if @bank.save
      redirect_to '/bancos', notice: 'Cuenta bancaria creada correctamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /banks/1
  def update
    if @bank.update(bank_params)
      redirect_to '/bancos', notice: 'Cuenta bancaria editada correctamente..'
    else
      render :edit
    end
  end

  # DELETE /banks/1
  def destroy
    @bank.destroy
    redirect_to '/bancos', notice: 'Cuenta bancaria eliminada correctamente.' 
  end

  #Metodos para admin
  def list
    @banks = Bank.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank
      @bank = Bank.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bank_params
      params.require(:bank).permit(:name, :acount, :nameaccount, :typemoney)
    end
end
