class Tweet
  include MongoMapper::Document

  key :text
  key :username
  key :hashtags,    Array
  key :mentions,    Array

end