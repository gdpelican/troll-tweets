require './backend/tweet'

module Queries
  class Yearly < Base
    def query!
      summary(:publish_date, :year)
    end

    private

    def transform(data)
      data.transform_keys(&:to_i)
          .sort
          .to_h
          .map { |name, value| { name: name, value: value } }
    end

    def settings
      super.merge(type: 'bar', label_x: 'Year')
    end
  end
end
