require './backend/tweet'
require 'byebug'

module Queries
  class Daily < Base
    def query!
      summary(:publish_date, :year, :doy)
    end

    private

    def transform(data)
      [{
        name: 'Tweets per day',
        series: data.transform_keys { |key| year, day = key.split('_').map(&:to_i); Date.new(year) + day.days }
                    .sort
                    .to_h
                    .transform_keys { |key| key.strftime('%d %b %Y') }
                    .map { |name, value| { name: name, value: value } }
      }]
    end

    def settings
      super.merge(label_x: 'Date')
    end
  end
end
