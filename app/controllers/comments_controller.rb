class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = current_user
  end
end
