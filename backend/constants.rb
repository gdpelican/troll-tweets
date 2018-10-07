require './backend/tweet'

class Constants
  def self.summary
    @@summary ||= Proc.new do |date_column, *date_parts|
      Proc.new do
        Tweet.group("CONCAT(#{Array(date_parts).map do |part|
          "date_part('#{part}', #{date_column})"
        end.join(", '_', ")})").count
      end
    end
  end

  def self.queries
    @@queries ||= Hash.new(Proc.new {[]}).merge(
      hourly:  summary.call(:publish_date, :hour),
      daily:   summary.call(:publish_date, :year, :doy),
      monthly: summary.call(:publish_date, :year, :month),
      yearly:  summary.call(:publish_date, :year)
    ).with_indifferent_access.freeze
  end

  def self.settings
    @@settings ||= Hash.new({}).merge(
      hourly: {
        colors: { domain: ['#5AA454', '#A10A28', '#C7B42C', '#AAAAAA'] },
        label_x: 'Time of Day',
        label_y: 'Number of tweets'
      }
    ).with_indifferent_access.freeze
  end

  def self.serializers
    @@serializers ||= Hash.new(Proc.new {[]}).merge(
      hourly: Proc.new do |raw|
        [{
          name: 'Tweets per hour',
          series: raw.transform_keys(&:to_i).sort.map do |hour, count|
            {
              name: Time.at(hour.to_i*3600).strftime('%I:%M%p'),
              value: count
            }
          end
        }]
      end
    ).with_indifferent_access.freeze
  end
end
