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

  POSITIVE = ["LongueiraGana",
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
"justo",
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
"empleo",
"votamos",
"servir",
"gana",
"ganar",
"ganado",
"próximo presidente de Chile",
"justo",
"líder de centroderecha ",
"propuestas",
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
"cambios maravillosos"]

  NEGATIVE = [
"Payasos",
"Debate facho",
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
"performance",
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
"chistosos",
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
]

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