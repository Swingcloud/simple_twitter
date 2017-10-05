class UsersController < ApplicationController

  def show
    @user = User.includes(:tweets).find_by(tag_name: params[:id])
    @tweets = @user.tweets.order('created_at DESC')
  end
end
