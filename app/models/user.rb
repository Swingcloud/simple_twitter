class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tweets, dependent: :destroy

  has_many :likes, foreign_key: 'user_id'
  has_many :like_tweets, through: :likes, source: :tweet

  has_many :following_friendships, class_name: 'Friendship', foreign_key: 'follower_id', dependent: :destroy
  has_many :following, through: :following_friendships, source: :followed

  has_many :followed_friendships, class_name: 'Friendship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :followed_friendships, source: :follower

  def admin?
    self.role == "admin"
  end

  def tag
    "@#{self.tag_name}"
  end
end
