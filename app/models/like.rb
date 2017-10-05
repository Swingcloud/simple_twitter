class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, :counter_cache => :liked_users_count

  validates :user_id, presence: true
  validates :tweet_id, presence: true
end
