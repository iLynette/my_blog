class ApplicationController < ActionController::Base
  def current_user
    User.find(params[:id] || params[:user_id])
  end

  def all_users
    User.all
  end
end
