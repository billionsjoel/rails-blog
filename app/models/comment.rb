class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_post_comment_counter

  private
  def update_post_comment_counter
    post.increment!(:comments_counter)
  end

  def update_post_likes_counter
    post.increment!(:likes_counter)
  end
end
