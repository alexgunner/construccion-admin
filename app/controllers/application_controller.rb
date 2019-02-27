class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nameinvoice, :namecompany, :ci, :nit, :phone, :cellphone, :cellwsp, :address, :imagenit, :imageci, :role, :state, :city])
 end
end
