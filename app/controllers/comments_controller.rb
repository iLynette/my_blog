class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = current_user
  end

  def create
    user = current_user
    post = current_post
    comment = Comment.new(comment_params)
    comment.author = user
    comment.post = post
    if comment.save
      flash[:notice] = 'Your comment has been saved'
      redirect_to user_post_url(id: post.id)
    else
      flash[:alert] = 'Comment was not saved!'
      redirect_to new_user_post_comment_url(post_id: post.id, user_id: user.id)
    end
  end

  def destroy
    puts params
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      redirect_to user_post_url
    else
      redirect_to user_posts_url
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
