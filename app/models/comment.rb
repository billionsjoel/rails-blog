class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_post_comment_counter(value)
    post = Post.where('id = ?',self.post_id).first
    post.comments_counter = value
    post.save
  end

  def update_post_likes_counter(value)
    post = Post.where('id = ?',self.post_id).first
    post.likes_counter = value
    post.save
  end
end
