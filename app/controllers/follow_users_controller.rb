class FollowUsersController < ApplicationController
  before_action :load_data_static

  def index
    @type = params[:type] || "following"
    @users = current_user.send(@type).order id: :desc
    unless @users.empty?
      follow_users_offset = params[:follow_users_offset] || (@users.first
        .id + 1)
      @users = @users.where("users.id < ?", follow_users_offset)
        .limit 4
      @last = @users.size < 4 ? true : false
    end
  end
end
