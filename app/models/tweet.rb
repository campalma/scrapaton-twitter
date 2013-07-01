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

  POSITIVE = [
    "LongueiraGana",
    "Apoyo",
    "presidente",
    "desarrollo",
    "votoAllamand",
    "votoLongueira",
    "somosLongueira",
    "PabloPdte",
    "PorUnChileMasJusto",
    "AllamandPresidente",
    "FirmeContigo",
    "orgullo",
    "sólido",
    "crear empleo",
    "FirmeConAllamand",
    "ganaremos",
    "logro",
    "triunfo",
    "felicitaciones",
    "entretenido",
    "bueno",
    "dominan",
    "preciso",
    "claro",
    "fortaleza",
    "Longueira2014",
    "auténtica",
    "sinceridad",
    "ministro de la competencia",
    "defensa de los consumidores",
    "clave",
    "votamos",
    "servir",
    "próximo presidente de Chile",
    "justo",
    "líder de centroderecha ",
    "emprendimiento",
    "innovación",
    "competencia",
    "ministro de economía",
    "me la juego",
    "presidente del empleo",
    "apoyando",
    "unidad",
    "certero",
    "firme",
    "Ganamos todos",
    "compromiso",
    "apoyar",
    "consecuente",
    "consecuencia",
    "opone",
    "aperrao",
    "fuertes",
    "cambios maravillosos",
    "longueirapresidente",
    "construir",
    "grande",
    "solido",
    "solidez"
  ]

  NEGATIVE = [
    "Payasos",
    "facho",
    "fome",
    "jesuita",
    "evasivas",
    "sueño",
    "momio",
    "centro derecha popular",
    "idiotas",
    "weon",
    "monopolio",
    "patético",
    "verguenza",
    "chiste",
    "fracaso",
    "risa",
    "durmiendo",
    "weas",
    "mentir",
    "miente",
    "mentira",
    "engaño",
    "estafar",
    "vergonzoso",
    "pedazos",
    "imbecilidades",
    "tontera",
    "tonto",
    "lata",
    "chistoso",
    "fiasco",
    "antipatía",
    "la derecha",
    "Legionarios de Cristo",
    "Opus Dei",
    "imbécil",
    "errada",
    "charlatán",
    "Vergüenza ajena",
    "dictadura",
    "ridícula",
    "no tiene argumentos",
    "irritante",
    "brecha",
    "reiterativo",
    "redundante",
    "asesinos",
    "papa de la boca",
    "papa en la boca",
    "ladrones",
    "molesta",
    "no me gusta",
    "estamos cagados",
    "detestamos",
    "abusadores",
    "weiando",
    "insulto",
    "mierda",
    "repugnante",
    "demagogo",
    "discriminacion",
    "duda",
    "jajaja",
    "nba"
  ]

  def is_positive?
    formatted_text = self.text.downcase.mb_chars.normalize(:kd).gsub(/[^x00-\x7F]/n, '').to_s
    NEGATIVE.each do |n|
      word = n.mb_chars.normalize(:kd).gsub(/[^x00-\x7F]/n, '').to_s
      if formatted_text.match(/#{word}/i)
        puts n
        return false
      end
    end

    POSITIVE.each do |p|
      word = p.mb_chars.normalize(:kd).gsub(/[^x00-\x7F]/n, '').to_s
      if formatted_text.match(/#{word}/i)
        puts p
        return true
      end
    end
    return nil
  end

  def group_key
    if self.created_at.min % 2 == 0
      self.created_at.hour.to_s+self.created_at.min.to_s+self.candidate+self.positive.to_s
    else
      self.created_at.hour.to_s+(self.created_at.min-1).to_s+self.candidate+self.positive.to_s
    end
  end

end