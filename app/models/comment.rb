class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :comments_counter
  belongs_to :post
  after_save :update_post_comment_counter
  validates :text,presence:true

  private

  def update_post_comment_counter
    post.increment!(:comments_counter)
  end
end
