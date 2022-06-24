class Api::PostsController < ApplicationController
  def index
    @user = current_user
    @posts = @user.posts.includes(:comments)
    render json:@posts
  end

  def show
  render json: @posts
  end
end
