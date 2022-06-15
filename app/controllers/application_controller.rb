class ApplicationController < ActionController::Base
  def current_user
    User.first
  end

  def all_users
    User.all
  end
end
