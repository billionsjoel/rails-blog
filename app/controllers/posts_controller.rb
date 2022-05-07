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
    @post = create_new_post
    @post.author_id = params[:user_id]
    if @post.save
      success
      show_errors
      render :new,status: 500
    else
      render :new
    end
  end

  def update
    new_post = create_new_post
    @post = find_post
    @post.title = new_post.title
    @post.text = new_post.text

    if @post.save
      success
      redirect_to user_post_url(id: @post.id)
    else
      show_errors
      render :edit
    end
  end

  private

  def success
    flash[:notice] = 'Your post was created      Successfully'
  end

  def failed
    flash.now[:alert] = 'You post was not saved'
  end

  def show_errors
    failed
      errors = @post.errors.map do |error|
        error.full_message
      end
      flash.now[:error] = errors.join(" | ")

  end

  def create_new_post
    Post.new(params.require(:post).permit(:title, :text))
  end

  def find_post
    Post.find params[:id]
  end
end
