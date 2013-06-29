class TweetsController < ApplicationController
  def index
    @tweets = Tweet.sort(:created_at).limit(100).all
    @min = @tweets.first.created_at.to_i
    @max = @tweets.last.created_at.to_i
    puts @min
    puts @max
    @diff= @max - @min
    @a = 700.0/@diff
    @b = -700*@min/(@diff)

    @bachelet   = 28
    @velasco    = 50
    @orrego     = 100
    @gomez    = 150
    @allamand  = 220
    @longueira      = 268


    puts @a
    puts @b
  end
end