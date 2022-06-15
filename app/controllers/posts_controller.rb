class PostsController < ApplicationController
  def index
    @user = current_user
  end
  def show
    @post = current_post
  end
end