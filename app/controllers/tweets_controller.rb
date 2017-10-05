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
    current_user_check
  end

  def updated
    @tweet = Tweet.find(params[:id])
    current_user_check
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render :edit
    end
  end

  def destroy
		@tweet= Tweet.find(params[:id])
    current_user_check
    @tweet.destroy
		redirect_to tweets_path
	end

  private

  def tweet_params
    params.require(:tweet).permit(:description)
  end

  def current_user_check
    if current_user != @tweet.user
      flash[:alert] = "you are not this user!"
      redirect_to :root
    end
  end
end
