class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  deserializable_resource :user, only: [:create, :update]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    #@user = User.create(email: 'dhara@gmail.com', password: 'admin123', password_confirmation: 'admin123')
    @user = User.new(user_params)
    puts "******"
    puts @user
    if @user.save
      render json: @user
    end
  end


  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to clients_url, notice: 'User was successfully destroyed.'
  end

  #Metodos para admin
  def list
    @users = User.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :lastname, :phone, :address, :ci, :nit, :email, :password, :password_confirmation,
      :imageci, :imagenit)
    end
end
