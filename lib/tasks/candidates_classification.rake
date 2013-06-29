desc "Tweets candidates classification"
task candidates_classification: :environment do
  Tweet.each do |t|
    text = t.text.downcase.mb_chars.normalize(:kd).gsub(/[^x00-\x7F]/n, '').to_s
    if text.include? "allamand"
      t.candidate = "allamand"
    elsif text.include? "longueira"
      t.candidate = "longueira"
    elsif text.include? "orrego"
      t.candidate = "orrego"
    elsif text.include? "bachelet"
      t.candidate = "bachelet"
    elsif text.include? "velasco"
      t.candidate = "velasco"
    elsif text.include? "gomez"
      t.candidate = "gomez"
    else
      t.candidate = nil
    end
    t.save
  end
end