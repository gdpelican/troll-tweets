require './backend/tweet'

module Queries
  class Daily < Base
    def query!(args = {})
      summary(:publish_date, :year, :doy)
    end

    private

    def transform(data)
      [{
        name: 'Tweets per day',
        series: data.transform_keys { |key| yearday_to_date(key) }
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
