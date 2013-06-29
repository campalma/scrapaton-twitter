class TweetsController < ApplicationController
  def index

    @tweets = Tweet.fields(:created_at, :positive, :candidate).where(:candidate.ne => nil, :positive.ne => nil).sort(:created_at).limit(100).all

    @groups = {}

    @tweets.each do |t|
        if @groups[t.created_at.min.to_s+t.candidate+t.positive.to_s].nil?
            @groups[t.created_at.min.to_s+t.candidate+t.positive.to_s] = [t]
        else
            @groups[t.created_at.min.to_s+t.candidate+t.positive.to_s] << t
        end
    end

    @min = @tweets.first.created_at.to_i
    @max = @tweets.last.created_at.to_i
    @diff= @max - @min
    @a = 700.0/@diff
    @b = -700*@min/(@diff)



    @bachelet   = 50
    @velasco    = 115
    @orrego     = 100
    @gomez    = 150
    @allamand  = 310
    @longueira      = 375
  end
end