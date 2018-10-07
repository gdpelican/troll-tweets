require './backend/tweet'

module Queries
  class Base
    def query!
      raise NotImplementedError.new
    end

    def serialize(data)
      settings.merge(data: transform(data))
    end

    private

    def transform(data)
      raise NotImplementedError.new
    end

    def settings
      {
        colors: { domain: ['#5AA454', '#A10A28', '#C7B42C', '#AAAAAA'] },
        label_y: 'Number of tweets'
      }
    end

    def summary(date_column, *date_parts)
      Tweet.group("CONCAT(#{Array(date_parts).map do |part|
        "date_part('#{part}', #{date_column})"
      end.join(", '_', ")})").count
    end
  end
end
