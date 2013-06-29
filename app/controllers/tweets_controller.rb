class TweetsController < ApplicationController
  def index
    @tweets = Tweet.where(:candidate.ne => nil).sort(:created_at).limit(100).all
    @groups = {}

    @tweets.each do |t|
        if @groups[t.created_at.min].nil?
            @groups[t.created_at.min] = []
        else
            @groups[t.created_at.min] << t
        end
    end

    @min = @tweets.first.created_at.to_i
    @max = @tweets.last.created_at.to_i
    @diff= @max - @min
    @a = 700.0/@diff
    @b = -700*@min/(@diff)
  end
end