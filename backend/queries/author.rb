require './backend/tweet'

module Queries
  class Author < Base
    def query!(args = {})
      raise unless @author = args[:author]
      Tweet.where(author: @author)
           .pluck(date_part_concat(:publish_date, :year, :doy), :followers)
           .to_h
           .merge(author: @author)
    end

    private

    def transform(data)
      [{
        name: data['author'],
        series: data.reject { |key| key == 'author' }
                    .transform_keys { |key| yearday_to_date(key) }
                    .sort
                    .map { |tweet| { name: tweet[0].strftime('%d %b %Y'), value: tweet[1] } }
      }]
    end

    def settings
      super.merge(type: 'line', label_x: 'Date', label_y: 'Number of followers')
    end
  end
end
