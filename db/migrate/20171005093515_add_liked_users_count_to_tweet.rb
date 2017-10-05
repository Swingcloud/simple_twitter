class AddLikedUsersCountToTweet < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :liked_users_count, :integer, :default => 0

    Tweet.pluck(:id).each do |i|
      Tweet.reset_counters(i, :liked_users) # 全部重算一次
    end
  end
end
