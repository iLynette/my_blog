class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = @user.posts.includes(:comments)
  end

  def new
    @new_post = Post.new
  end

  def create
    puts params
    user = current_user
    post = Post.new(post_params)
    post.author = user
    post.comments_counter = 0
    post.likes_counter = 0
    if post.save
      flash[:notice] = 'Your post has been saved'
      redirect_to user_posts_url
    else
      flash[:alert] = 'Your comment has been saved'
      redirect_to new_user_post_url(user_id: user.id)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
