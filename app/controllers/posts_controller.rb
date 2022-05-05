class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = current_user.last_three_posts
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.recent_comments
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

end
