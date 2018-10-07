require 'sinatra/activerecord'
require './backend/constants'
require 'byebug'

class Query < ActiveRecord::Base
  store_accessor :value

  def self.perform(key)
    (
      find_by(key: key) ||
      create(key: key, value: value_for(key))
    ).serialize
  end

  def self.value_for(key)
    Constants.serializers[key].call(Constants.queries[key].call)
  end

  def serialize
    Constants.settings[key].merge(data: value)
  end
end
