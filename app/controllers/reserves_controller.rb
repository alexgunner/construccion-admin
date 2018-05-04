class ReservesController < ApplicationController
  before_action :set_reserf, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  deserializable_resource :reserve, only: [:create, :update]

  # GET /reserves
  def index
    @reserves = Reserve.all
  end

  # GET /reserves/1
  def show
  end

  # GET /reserves/new
  def new
    @reserf = Reserve.new
  end

  # GET /reserves/1/edit
  def edit
  end

  # POST /reserves
  def create
    @reserf = Reserve.new(reserf_params)

    if @reserf.save
      redirect_to @reserf, notice: 'Reserve was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reserves/1
  def update
    if @reserf.update(reserf_params)
      redirect_to @reserf, notice: 'Reserve was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reserves/1
  def destroy
    @reserf.destroy
    redirect_to reserves_url, notice: 'Reserve was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserf
      @reserf = Reserve.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reserf_params
      params.require(:reserf).permit(:name, :description)
    end
end
