class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: :create

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit :email, :name, :password, :password_confirmation
    end
  end
end
