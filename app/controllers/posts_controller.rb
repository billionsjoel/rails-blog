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

  def create
    @post = Post.new(params.require(:post).permit(:title,:text))
    @post.author_id = params[:user_id]
    if @post.save
      flash[:success]='Post created Successfully'
      redirect_to user_posts_url
    else
       @post.errors.full_messages
      render :new
    end
  end
end
