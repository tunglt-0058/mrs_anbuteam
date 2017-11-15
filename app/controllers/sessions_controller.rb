class SessionsController < Devise::SessionsController
  def create
    super
    create_cookie
  end

  private
  def create_cookie
    cookies[:user_id] = current_user.id
  end
end
