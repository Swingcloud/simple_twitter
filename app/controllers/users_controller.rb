class UsersController < ApplicationController

  def show
    @user = User.includes(:tweets).find(params[:id])
    @tweets = @user.tweets
  end
end
