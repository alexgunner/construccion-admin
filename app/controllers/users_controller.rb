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
    @user = User.new(user_params)
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
    redirect_to '/usuarios', notice: 'User was successfully destroyed.'
  end

  #Metodos para admin
  def list
    @users = User.search(params[:search])
  end

  def enable
    @user = User.find(params[:id])
  end

  def do_enable
    user = User.find(params[:do_enable][:id])
    while params[:do_enable][:role].gsub!(/\([^()]*\)/,""); end
    user.role = params[:do_enable][:role]
    user.state = true
    user.save
    redirect_to "/usuarios"
  end

  def bloq
    user = User.find(params[:id])
    user.role = "Bloqueado"
    user.state = false
    user.save
    redirect_to "/usuarios"
  end

  def desbloq
    user = User.find(params[:id])
    user.role = nil
    user.state = nil
    user.save
    redirect_to "/usuarios"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :lastname, :phone, :address, :ci, :nit, :email, :password, :password_confirmation,
      :image)
    end
end
