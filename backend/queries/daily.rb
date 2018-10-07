require './backend/tweet'

module Queries
  class Daily < Base
    def query!
      summary(:publish_date, :year, :doy)
    end

    private

    def transform(data)
      [{
        name: 'Tweets per day',
        series: data.sort.map do |year_day, count|
          {
            name: year_day,
            value: count
          }
        end
      }]
    end

    def settings
      super.merge(label_x: 'Date')
    end
  end
end
