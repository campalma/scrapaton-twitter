class TweetsController < ApplicationController
  def index

    @tweets = Rails.cache.fetch("tweets", expires_in: 1.year) do
        Tweet.fields(:created_at, :positive, :candidate).where(:candidate.ne => nil, :positive.ne => nil).sort(:created_at).all
    end

    @groups = {}

    @tweets.each do |t|
        group_key = t.group_key
        if @groups[group_key].nil?
            @groups[group_key] = [t]
        else
            @groups[group_key] << t
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

    @min = @tweets.first.created_at.to_i
    @max = @tweets.last.created_at.to_i
    @diff= @max - @min
    @a = 700.0/@diff
    @b = -700*@min/(@diff)

    @gdiff = @gmax - @gmin
    @ga = 80.0/@gdiff
    @gb = 20 - (100*@gmin/@gdiff)

    @bachelet   = 50
    @velasco    = 115
    @orrego     = 180
    @gomez      = 245
    @allamand   = 310
    @longueira  = 375
  end
end