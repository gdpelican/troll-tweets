require './backend/tweet'

module Queries
  class Hourly < Base
    def query!
      summary(:publish_date, :hour)
    end

    private

    def transform(data)
      [{
        name: 'Tweets per hour',
        series: data.transform_keys(&:to_i).sort.map do |hour, count|
          {
            name: Time.at(hour.to_i*3600).strftime('%I:%M%p'),
            value: count
          }
        end
      }]
    end

    def settings
      super.merge(label_x: 'Time of Day')
    end
  end
end
