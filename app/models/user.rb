class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tweets, dependent: :destroy

  has_many :likes, foreign_key: 'user_id'
  has_many :like_tweets, through: :likes, source: :tweet

  def admin?
    self.role == "admin"
  end

  def tag
    "@#{self.tag_name}"
  end
end
