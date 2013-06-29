class Tweet
  include MongoMapper::Document

  key :text
  key :username
  key :created_at,  Time
  key :hashtags,    Array
  key :mentions,    Array

end