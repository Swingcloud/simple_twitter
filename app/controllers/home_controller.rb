class HomeController < ApplicationController

  def index
    @tweets = Tweet.includes(:user).all
  end
end
