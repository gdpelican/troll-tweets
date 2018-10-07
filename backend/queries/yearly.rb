require './backend/tweet'

module Queries
  class Yearly < Base
    def query!
      summary(:publish_date, :year)
    end

    private

    def transform(data)
      [{
        name: 'Tweets per year',
        series: data.transform_keys(&:to_i).sort.map do |year, count|
          {
            name: year.to_s,
            value: count
          }
        end
      }]
    end

    def settings
      super.merge(label_x: 'Year')
    end
  end
end
