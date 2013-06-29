desc "Positive-negative classification"
task positive_negative: :environment do

  Tweet.each do |t|
    t.positive = t.is_positive?
    t.save
  end
end