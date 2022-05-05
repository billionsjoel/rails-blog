class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = current_user.posts
  end
end
