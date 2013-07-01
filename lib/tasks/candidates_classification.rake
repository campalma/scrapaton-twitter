desc "Tweets candidates classification"
task candidates_classification: :environment do
  Tweet.each do |t|
    text = t.text.downcase.mb_chars.normalize(:kd).gsub(/[^x00-\x7F]/n, '').to_s
    if text.match(/allaman|alaman/i)
      t.candidate = "allamand"
    elsif text.match(/longueira|longeira|#long/i)
      t.candidate = "longueira"
    elsif text.match(/orrego/i)
      t.candidate = "orrego"
    elsif text.match(/bachelet|gordis|michelle|bachellet/i)
      t.candidate = "bachelet"
    elsif text.match(/velasco/i)
      t.candidate = "velasco"
    elsif text.match(/gomez/i)
      t.candidate = "gomez"
    else
      t.candidate = nil
    end
    t.save
  end
end