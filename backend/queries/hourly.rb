require './backend/tweet'

module Queries
  class Hourly < Base
    def query!(args = {})
      summary(:publish_date, :hour)
    end

    private

    def transform(data)
      [{
        name: 'Tweets per hour',
        series: data.transform_keys(&:to_i)
                    .sort
                    .to_h
                    .transform_keys { |key| Time.at(key*3600).strftime('%I:%M %P') }
                    .map { |name, value| { name: name, value: value } }
      }]
    end

    def settings
      super.merge(label_x: 'Time of Day')
    end
  end
end
