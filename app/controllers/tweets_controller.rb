class TweetsController < ApplicationController
  def index
    @tweets = Tweet.sort(:created_at).all
    @min = @tweets.first.created_at.to_i
    @max = @tweets.last.created_at.to_i
    puts @min
    puts @max
    @diff= @max - @min
    @a = 700.0/@diff
    @b = -700*@min/(@diff)
    puts @a
    puts @b
  end
end