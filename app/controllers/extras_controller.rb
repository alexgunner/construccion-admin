class ExtrasController < ApplicationController
  before_action :set_extra, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "dashboard"
  # GET /extras
  def index
    @extras = Extra.all
    render json: @extras
  end

  # GET /extras/1
  def show
  end

  # GET /extras/new
  def new
    @extra = Extra.new
  end

  # GET /extras/1/edit
  def edit
  end

  # POST /extras
  def create
    @extra = Extra.new(extra_params)

    respond_to do |format|
      if @extra.save
        format.html { redirect_to '/extra', notice: 'Correctamente creado' }
        format.json { render :show, status: :created, location: @extra }
      else
        format.html { render :new }
        format.json { render json: @extra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extras/1
  def update
    respond_to do |format|
      if @extra.update(extra_params)
        format.html { redirect_to '/extra', notice: 'Correctamente actualizado' }
        format.json { render :show, status: :ok, location: @extra }
      else
        format.html { render :edit }
        format.json { render json: @extra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extras/1
  def destroy
    @extra.destroy
    redirect_to extras_url, notice: 'Extra was successfully destroyed.'
  end

  #Metodos para admin
  def list
    @extras = Extra.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extra
      @extra = Extra.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def extra_params
      params.require(:extra).permit(:name, :services, :banner, :logo)
    end
end
