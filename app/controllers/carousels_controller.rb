class CarouselsController < ApplicationController
  before_action :set_carousel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "dashboard"
  # GET /carousels
  def index
    @carousels = Carousel.all
    render json: @carousels
  end

  def carousel_list
    @carousels = Carousel.all
  end

  # GET /carousels/1
  def show
  end

  # GET /carousels/new
  def new
    @carousel = Carousel.new
  end

  # GET /carousels/1/edit
  def edit
  end

  # POST /carousels
  def create
    @carousel = Carousel.new(carousel_params)

    if @carousel.save
      redirect_to '/carousel_list', notice: 'Carousel was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /carousels/1
  def update
    if @carousel.update(carousel_params)
      redirect_to '/carousel_list', notice: 'Carousel was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /carousels/1
  def destroy
    @carousel.destroy
    redirect_to '/carousel_list', notice: 'Carousel was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carousel
      @carousel = Carousel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def carousel_params
      params.require(:carousel).permit(:pic, :pic_type)
    end
end
