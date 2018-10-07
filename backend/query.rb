require 'sinatra/activerecord'

class Query < ActiveRecord::Base
  store_accessor :value

  def self.perform(key)
    find_by(key: key)
    if existing = find_by(key: key)
      existing.value
    else
      create(
        key: key,
        value: yield.to_h,
        query: (yield.to_sql if yield.respond_to?(:to_sql))
      )
    end
  end
end
