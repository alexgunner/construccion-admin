class TrainingCategoriesController < ApplicationController
  before_action :set_training_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout "dashboard"
  # GET /training_categories
  def index
    @training_categories = TrainingCategory.all
  end

  # GET /training_categories/1
  def show
  end

  # GET /training_categories/new
  def new
    @training_category = TrainingCategory.new
  end

  # GET /training_categories/1/edit
  def edit
  end

  # POST /training_categories
  def create
    @training_category = TrainingCategory.new(training_category_params)

    if @training_category.save
      redirect_to training_categories_url, notice: 'Categoría creada'
    else
      render :new
    end
  end

  # PATCH/PUT /training_categories/1
  def update
    if @training_category.update(training_category_params)
      redirect_to training_categories_url, notice: 'Categoriía actualizada'
    else
      render :edit
    end
  end

  # DELETE /training_categories/1
  def destroy
    @training_category.destroy
    redirect_to training_categories_url, notice: 'Categoriía actualizada'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_category
      @training_category = TrainingCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def training_category_params
      params.require(:training_category).permit(:name)
    end
end
