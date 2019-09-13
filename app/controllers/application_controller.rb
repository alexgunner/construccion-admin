class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nameinvoice, :namecompany, :ci, :nit, :phone, :cellphone, :cellwsp, :address, :imagenit, :imageci, :role, :state, :city])
 end

 protected
  def authenticate_admin!
    unless current_user.role == "Administrador"
      flash[:danger] = "No tienes autorización para entrar en esa sección"
      redirect_to root_path
    end
  end
end
