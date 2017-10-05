class HomeController < ApplicationController

  def index
    @tweets = Tweet.includes(:user).all.order('created_at DESC')
  end
end
