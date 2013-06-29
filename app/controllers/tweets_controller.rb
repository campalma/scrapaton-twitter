class TweetsController < ApplicationController
  def index


    @tweets = Tweet.where(:candidate.ne => nil).sort(:created_at).limit(100).all
    @min = @tweets.first.created_at.to_i
    @max = @tweets.last.created_at.to_i
    puts @min
    puts @max
    @diff= @max - @min
    @a = 700.0/@diff
    @b = -700*@min/(@diff)

    @bachelet   = 50
    @velasco    = 115
    @orrego     = 100
    @gomez    = 150
    @allamand  = 310
    @longueira      = 375


    puts @a
    puts @b
  end
end