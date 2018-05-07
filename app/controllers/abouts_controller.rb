class AboutsController < ApplicationController
  before_action :set_about, only: [:show, :edit, :update, :destroy]

  # GET /abouts
  def index
    @abouts = About.all
  end

  # GET /abouts/1
  def show
    render json: @about
  end

  # GET /abouts/new
  def new
    @about = About.new
  end

  # GET /abouts/1/edit
  def edit
  end

  # POST /abouts
  def create
    @about = About.new(about_params)

    if @about.save
      redirect_to @about, notice: 'About was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /abouts/1
  def update
    if @about.update(about_params)
      redirect_to @about, notice: 'About was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /abouts/1
  def destroy
    @about.destroy
    redirect_to abouts_url, notice: 'About was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about
      @about = About.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def about_params
      params.require(:about).permit(:description)
    end
end
