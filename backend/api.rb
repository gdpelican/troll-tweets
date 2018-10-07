require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?

require './backend/config'
require './backend/query'
require './backend/tweet'

get '/summary/published/hourly' do
  json Query.perform(:hourly) { summary(:publish_date, :hour).transform_keys(&:to_i) }
end

get '/summary/published/daily' do
  json Query.perform(:daily) { summary(:publish_date, :year, :doy) }
end

get '/summary/published/monthly' do
  json Query.perform(:monthly) { summary(:publish_date, :year, :month) }
end

get '/summary/published/yearly' do
  json Query.perform(:yearly) { summary(:publish_date, :year) }
end

def summary(date_column, *date_parts)
  Tweet.group("CONCAT(#{Array(date_parts).map do |part|
    "date_part('#{part}', #{date_column})"
  end.join(", '_', ")})").count
end
