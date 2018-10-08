require 'require_all'
require 'sinatra/activerecord'
require_all './backend/queries'

class Query < ActiveRecord::Base
  store_accessor :value

  def self.perform(key)
    klass = "Queries::#{key.to_s.classify}".constantize.new
    klass.serialize find_by(key: key) || create(key: key, value: klass.query!)
  end

  def self.perform!(key)
    find_by(key: key).destroy
    perform(key)
  end
end
