class LikesController < ApplicationController
  def create
    like = Like.new(author: current_user, post: current_post)
    # redirect_to user_post_url(current_user, current_post)
    if like.save
      flash[:notice] = 'You liked the post.'
      redirect_to user_post_url(current_user, current_post)
    else
      flash[:alert] = 'Cant like twice, silly.'
      redirect_to { new_user_post(current_user) }
    end
  end
end
