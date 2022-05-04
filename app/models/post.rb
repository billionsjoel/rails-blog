class Post < ApplicationRecord
  belongs_to :author, class_name: 'User',  counter_cache: :posts_counter
  has_many :likes, :comments
end
