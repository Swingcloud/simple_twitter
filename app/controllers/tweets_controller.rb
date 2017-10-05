class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.includes(:user).all.order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def updated
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render :edit
    end
  end

  def destroy
		@tweet= Tweet.find(params[:id])
    @tweet.destroy
		redirect_to tweets_path
	end

  private

  def tweet_params
    params.require(:tweet).permit(:description)
  end
end
