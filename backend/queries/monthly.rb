require './backend/tweet'

module Queries
  class Monthly < Base
    def query!(args = {})
      summary(:publish_date, :year, :month)
    end

    private

    def transform(data)
      [{
        name: 'Tweets per month',
        series: data.transform_keys { |key| Date.new(*key.split('_').map(&:to_i)) }
                    .sort
                    .map { |month, count| { name: month.strftime("%b %Y"), value: count } }
      }]
    end

    def settings
      super.merge(label_x: 'Month')
    end
  end
end
