class Tweet
  include MongoMapper::Document

  key :text
  key :username
  key :candidate
  key :created_at,  Time
  key :hashtags,    Array
  key :mentions,    Array

end