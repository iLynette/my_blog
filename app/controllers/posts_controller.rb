class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @new_post = Post.new
  end

  def create
    puts params
    user = current_user
    post = Post.new(post_params)
    post.author = user
    if post.save
      redirect_to user_posts_url(id: user.id)
    else
      redirect_to new_user_post_url(user_id: user.id)
    end
  end

  def post_params
   params.require(:post).permit(:title, :text)
  end
end
