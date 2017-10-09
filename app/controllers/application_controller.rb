class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def load_data_static
    if user_signed_in?
      @followings = current_user.just_followed
        .limit 5
      @know_users = current_user.know_users.limit 5
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update,
      keys: [:name, :role, :sex, :avatar])
  end
end
