require 'postgres-copy'
require 'sinatra/activerecord'

class Tweet < ActiveRecord::Base
  acts_as_copy_target
end
