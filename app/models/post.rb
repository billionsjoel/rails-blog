class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0}
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0}
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
