# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_up_params

  # GET /resource/sign_in

  # POST /resource/sign_in

  # DELETE /resource/sign_out

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email zipcode prefecture_code city street other_address])
  end
end
