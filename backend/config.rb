require 'sinatra'
require 'sinatra/activerecord'

set :port, ENV.fetch('PORT', 9292)
set :bind, '0.0.0.0'
set :database, ENV.fetch('DATABASE_URL', 'postgres://localhost:5432/troll_tweets_development')
