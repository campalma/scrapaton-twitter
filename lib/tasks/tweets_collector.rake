desc "Tweets Collector"
task tweets_collector: :environment do
  f = File.read("/Users/camilo/Downloads/debate_derecha/tweets_debate.json")
  tweets = JSON.parse(f)
  tweets = tweets.first["statuses"]
  tweets.each do |t|
    hashtags = t["entities"]["hashtags"].collect do |h|
      h["text"]
    end
    mentions = t["entities"]["user_mentions"].collect do |m|
      m["screen_name"]
    end
    Tweet.create(text: t["text"], username: t["user"]["screen_name"], mentions: mentions, hashtags: hashtags, created_at: t["created_at"])
  end
end