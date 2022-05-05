class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  after_save :update_posts_count

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  def path
    post_path id: id, user_id: author.id
  end

  private

  def update_posts_count
    author.increment!(:posts_counter)
  end
end
