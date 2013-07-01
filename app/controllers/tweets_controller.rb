class TweetsController < ApplicationController
  def index

    @tweets = Tweet.fields(:created_at, :positive, :candidate).where(:candidate.ne => nil, :positive.ne => nil).sort(:created_at).all

    @groups = {}

    @tweets.each do |t|
        if @groups[t.created_at.hour.to_s+t.created_at.min.to_s+t.candidate+t.positive.to_s].nil?
            @groups[t.created_at.hour.to_s+t.created_at.min.to_s+t.candidate+t.positive.to_s] = [t]
        else
            @groups[t.created_at.hour.to_s+t.created_at.min.to_s+t.candidate+t.positive.to_s] << t
        end
    end

    @gmin = 100000
    @gmax = 0

    @groups.each do |key, val|
        if @gmax < val.count
            @gmax = val.count
        end
        if @gmin > val.count
            @gmin = val.count
        end
    end

    puts @gmax
    puts @gmin

    @min = @tweets.first.created_at.to_i
    @max = @tweets.last.created_at.to_i
    @diff= @max - @min
    @gdiff=@gmax-@gmin
    @a = 700.0/@diff
    @b = -700*@min/(@diff)

    @ga=80.0/@gdiff
    @gb=20-(100*@gmin/@gdiff)



    @bachelet   = 50
    @velasco    = 115
    @orrego     = 180
    @gomez    = 150
    @allamand  = 310
    @longueira      = 375
  end
end