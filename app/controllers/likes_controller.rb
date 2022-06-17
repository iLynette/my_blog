class LikesController < ApplicationController
  def create
    like = Like.new(author: current_user, post: current_post)
    redirect_to user_post_url(current_user, current_post) if like.save
  end
end
