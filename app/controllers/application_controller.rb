class ApplicationController < ActionController::Base

  def all_users
    User.all
  end

  def current_post
    User.find(params[:user_id]).posts.find(params[:id] || params[:post_id])
  end
end
