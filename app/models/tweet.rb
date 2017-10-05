class Tweet < ApplicationRecord
  belongs_to :user

  has_many :likes, foreign_key: 'tweet_id'
  has_many :liked_users, through: :likes, source: :user
end
