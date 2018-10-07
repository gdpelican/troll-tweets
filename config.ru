require 'bundler/setup'

require_relative './backend/api'

run Sinatra::Application
