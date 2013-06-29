class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @min = Tweet.sort(:created_at).first.created_at.to_i
    @max = Tweet.sort(:created_at).last.created_at.to_i
    @diff= @max - @min


  end
end