require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?

require './backend/config'
require './backend/query'
require './backend/tweet'

get '/summary/published/hourly' do
  json Query.perform(:hourly)
end

get '/summary/published/daily' do
  json Query.perform(:daily)
end

get '/summary/published/monthly' do
  json Query.perform(:monthly)
end

get '/summary/published/yearly' do
  json Query.perform(:yearly)
end
