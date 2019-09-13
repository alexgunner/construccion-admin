class IndustriesController < ApplicationController
  before_action :set_industry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout "dashboard"
  # GET /industries
  def index
    @industries = Industry.all
    render json: @industries
  end

  # GET /industries/1
  def show
  end

  # GET /industries/new
  def new
    @industry = Industry.new
  end

  # GET /industries/1/edit
  def edit
  end

  # POST /industries
  def create
    @industry = Industry.new(industry_params)

    if @industry.save
      redirect_to '/industrias', notice: 'Industry was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /industries/1
  def update
    if @industry.update(industry_params)
      redirect_to '/industrias', notice: 'Industry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /industries/1
  def destroy
    @industry.destroy
    redirect_to industries_url, notice: 'Industry was successfully destroyed.'
  end

  #Metodos admin
  def list
    @industries = Industry.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industry
      @industry = Industry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def industry_params
      params.require(:industry).permit(:country, :origin)
    end
end
