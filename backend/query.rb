require 'byebug'
require 'require_all'
require 'sinatra/activerecord'
require './backend/queries/base'
require_all './backend/queries'

class Query < ActiveRecord::Base
  store_accessor :value

  def self.perform(key, args = {})
    cache_key = args.fetch(:cache_key, key)
    klass = "Queries::#{key.to_s.classify}".constantize.new
    klass.serialize find_by(key: cache_key) || create(key: cache_key, value: klass.query!(args))
  end

  def self.perform!(key, args = {})
    find_by(key: args.fetch(:cache_key, key))&.destroy
    perform(key, args)
  end
end
