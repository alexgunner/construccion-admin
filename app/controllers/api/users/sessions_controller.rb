# frozen_string_literal: true

class Api::Users::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in

  def create
    super do |user|
      data = {
        token: user.authenticatable_salt,
        id: user.id,
        email: user.email,
        name: user.name,
        namecompany: user.namecompany,
        address: user.address,
        ci: user.ci,
        nameinvoice: user.nameinvoice,
        nit: user.nit,
        phone: user.phone,
        cellphone: user.cellphone,
        cellwsp: user.cellwsp,
        role: user.role,
        state: user.state,
        image: user.image,
        imageci: user.imageci
      }
      render json: data, status: 201 and return
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
