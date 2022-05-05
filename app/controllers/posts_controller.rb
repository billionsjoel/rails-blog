class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = current_user.last_three_posts
  end

  def show
    @post = find_post
    @comments = @post.comments
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def edit
    @post = find_post
  end

  def create
    @post = new_post
    @post.author_id = params[:user_id]
    if @post.save
      flash[:success]='Post created Successfully'
      redirect_to user_posts_url(id:@post.id)
    else
      render :new
    end
  end
end
