require 'require_all'
require 'sinatra/activerecord'
require_all './backend/queries'

class Query < ActiveRecord::Base
  store_accessor :value

  def self.perform(key)
    serialize(
      find_by(key: key) ||
      create(key: key, value: class_for(key).new.query!)
    )
  end

  def self.serialize(query)
    class_for(query.key).new.serialize(query.value)
  end

  def self.class_for(key)
    "Queries::#{key.to_s.classify}".constantize
  end
end
