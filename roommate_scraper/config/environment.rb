require 'bundler'
Bundler.require 

DB = {
  :conn => SQLite3::Database.new("db/rooms-development.db")
}

require_all 'lib'

