class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: :create

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit :email, :name, :password, :password_confirmation
    end
  end

  protected
  def update_resource resource, params
    current_password = params[:current_password]
    if current_password.present?
      if current_password == params[:password]
        resource.errors.add :password, t("user.edit.not_same")
      else
        super
      end
    else
      resource.update_without_password params
    end
  end

  def after_update_path_for *args
    edit_user_registration_path if args[0]
  end

  # def respond_with resource, opts = {}
  #   if params[:user][:avatar].present?
  #     render json: resource.avatar
  #   else
  #     super
  #   end
  # end
end
