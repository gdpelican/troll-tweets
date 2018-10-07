require './backend/tweet'

module Queries
  class Monthly < Base
    def query!
      summary(:publish_date, :year, :month)
    end

    private

    def transform(data)
      [{
        name: 'Tweets per month',
        series: data.sort.map do |year_month, count|
          {
            name: year_month,
            value: count
          }
        end
      }]
    end

    def settings
      super.merge(label_x: 'Month')
    end
  end
end
