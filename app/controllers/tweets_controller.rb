class TweetsController < ApplicationController
  def index
    @tweets = Tweet.where(:candidate.ne => nil).sort(:created_at).limit(1000).all
    @groups = {}

    @tweets.each do |t|
        if @groups[t.created_at.min.to_s+t.candidate].nil?
            @groups[t.created_at.min.to_s+t.candidate] = []
        else
            @groups[t.created_at.min.to_s+t.candidate] << t
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

    awesome_print @groups.keys
  end
end