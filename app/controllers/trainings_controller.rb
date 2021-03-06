class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_admin!
  layout "dashboard"
  # GET /trainings
  def index
    @trainings = Training.all
    render json: @trainings
  end

  def training
    @trainings = Training.all
  end

  # GET /trainings/1
  def show
  end

  # GET /trainings/new
  def new
    @training = Training.new
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /trainings
  def create
    @training = Training.new(training_params)

    if @training.save
      redirect_to '/training', notice: 'Documento creado correctamente'
    else
      render :new
    end
  end

  # PATCH/PUT /trainings/1
  def update
    if @training.update(training_params)
      redirect_to '/training', notice: 'Documento actualizado correctamente'
    else
      render :edit
    end
  end

  # DELETE /trainings/1
  def destroy
    @training.destroy
    redirect_to '/training', notice: 'Documento eliminado correctamente'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def training_params
      params.require(:training).permit(:name, :docu, :description, :videolink, :training_category_id)
    end
end
