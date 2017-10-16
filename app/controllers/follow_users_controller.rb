class FollowUsersController < ApplicationController
  before_action :load_data_static

  def index
    @type = params[:type] || "following"
    @users = current_user.send(@type).order id: :desc
    following_users_size = Settings.load_following_users_size
    unless @users.empty?
      follow_users_offset = params[:follow_users_offset] || (@users.first
        .id + 1)
      @users = @users.where("users.id < ?", follow_users_offset)
        .limit following_users_size
      @last = @users.size < following_users_size ? true : false
    end
  end
end
