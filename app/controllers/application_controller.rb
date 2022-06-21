class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def all_users
    User.all
  end

  def current_post
    User.find(params[:user_id]).posts.find(params[:id] || params[:post_id])
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :name, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email,:name, :password, :current_password)}
  end
end
