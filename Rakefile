require 'sinatra/activerecord/rake'
require 'net/http'
require 'byebug'

namespace :db do
  task :load_config do
    require_relative "./backend/config"
  end

  task :download_data do
    13.times do |i|
      response = Net::HTTP.get_response(URI("https://github.com/fivethirtyeight/russian-troll-tweets/blob/master/IRAhandle_tweets_#{i+1}.csv?raw=true"))
      response = Net::HTTP.get_response(URI(response['location'])) while response.is_a?(Net::HTTPRedirection)
      File.open("data/IRAHandle_tweets_#{i+1}.csv", 'w+') { |f| f.write(response.body) }
    end
  end

  task :load_data do
    require_relative "./backend/config"
    require_relative "./backend/tweet"
    Tweet.delete_all
    13.times do |i|
      puts "Copying file #{i+1}"
      Tweet.copy_from "data/IRAHandle_tweets_#{i+1}.csv" do |row|
        row + [row[5].match(/\d+\/\d+\/\d+ (\d+):\d+/)[1]]
      end
    end
  end
end
