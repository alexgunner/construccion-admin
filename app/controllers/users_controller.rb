class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout "dashboard"
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
    @user = User.find(params[:id])
    render :layout => "application"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.register_email(@user).deliver_now
      render json: @user
    end
  end


  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to '/', notice: 'Usuario editado correctamente' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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

  def showuser
    @user = User.find(params[:id])
  end

  def contact
    @user = User.find(params[:id])
  end

  def do_contact
    user = User.find(params[:do_contact][:id])
    message = params[:do_contact][:comment]
    UserMailer.notice_email(user, message).deliver_now
    redirect_to "/usuarios"
  end

  def do_edit
    user = User.find(params[:do_edit][:id])
    user.name = params[:do_edit][:name]
    user.namecompany = params[:do_edit][:namecompany]
    user.ci = params[:do_edit][:ci]
    user.nit = params[:do_edit][:nit]
    user.address = params[:do_edit][:address]
    user.phone = params[:do_edit][:phone]
    user.cellphone = params[:do_edit][:cellphone]
    user.cellwsp = params[:do_edit][:cellwsp]
    if !params[:do_edit][:city].blank?
      user.city = params[:do_edit][:city]
    end
    if params[:do_edit][:imageci] != nil
      user.imageci = params[:do_edit][:imageci]
    end
    if params[:do_edit][:imagenit] != nil
      user.imagenit = params[:do_edit][:imagenit]
    end
    user.save
    redirect_to '/'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :namecompany, :phone, :address, :ci, :nit, :email, :password, :password_confirmation,
      :imagenit, :cellphone, :cellwsp, :nameinvoice, :imageci, :city)
    end
end
