require './backend/tweet'

module Queries
  class Base
    def query!(args = {})
      raise NotImplementedError.new
    end

    def serialize(query)
      settings.merge(data: transform(query.value))
    end

    private

    def transform
      raise NotImplementedError.new
    end

    def settings
      {
        type: 'area',
        colors: { domain: ['#5AA454', '#A10A28', '#C7B42C', '#AAAAAA'] },
        label_y: 'Number of tweets'
      }
    end

    def yearday_to_date(yearday)
      year, day = yearday.split('_').map(&:to_i)
      Date.new(year) + day.days
    end

    def summary(date_column, *date_parts)
      Tweet.group(date_part_concat(date_column, *date_parts)).count
    end

    def date_part_concat(date_column, *date_parts)
      "CONCAT(#{Array(date_parts).map do |part|
        "date_part('#{part}', #{date_column})"
      end.join(", '_', ")})"
    end
  end
end
