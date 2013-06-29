# encoding: utf-8

class Tweet
  include MongoMapper::Document

  key :text
  key :username
  key :candidate
  key :positive,    Boolean
  key :created_at,  Time
  key :hashtags,    Array
  key :mentions,    Array

  POSITIVE = %w{LongueiraGana Apoyo centro derecha popular presidente desarrollo votoAllamand votoLongueira somosLongueira PabloPdte PorUnChileMasJusto AllamandPresidente FirmeContigo orgullo sólido}
  NEGATIVE = ["Payasos", "Debate facho", "fome", "jesuita", "evasivas", "sueño", "momio", "centro derecha popular", "idiotas", "weon", "monopolio", "patético"]

  def is_positive?
    formatted_text = self.text.downcase.mb_chars.normalize(:kd).gsub(/[^x00-\x7F]/n, '').to_s
    NEGATIVE.each do |n|
      if formatted_text.include? n.downcase.mb_chars.normalize(:kd).gsub(/[^x00-\x7F]/n, '').to_s
        return false
      end
    end

    POSITIVE.each do |p|
      if formatted_text.include? p.downcase.mb_chars.normalize(:kd).gsub(/[^x00-\x7F]/n, '').to_s
        return true
      end
    end
    return nil
  end

end