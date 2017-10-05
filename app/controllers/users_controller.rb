class UsersController < ApplicationController

  def show
    @user = User.includes(:tweets).find_by(tag_name: params[:id])
    @tweets = @user.tweets.order('created_at DESC')
  end

  def follow
    @user = User.find_by(tag_name: params[:id])
    current_user.following_friendships.create(followed_id: @user.id)
    redirect_to user_path(@user)
  end

  def unfollow
    @user = User.find_by(tag_name: params[:id])
    current_user.following_friendships.find_by(followed_id: @user.id).destroy
    redirect_to user_path(@user)
  end
end
