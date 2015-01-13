class Forecast < ActiveRecord::Base
  validates :forecast_json, presence: true

  belongs_to :location

  def currently
    CurrentlyData.new(forecast_json['currently'])
  end

  def self.request(location)
    ForecastIO.api_key = Threecast.settings.forecast_io_api_key
    ForecastIO.forecast(location.lat, location.lng)
  end

  def self.store(forecast_data, location)
    create(forecast_json: forecast_data.to_json, location_id: location.id)
  end
end

CurrentlyData = Struct.new(:temperature, :apparent_temperature) do
  def initialize(properties = {})
    super(
      properties['temperature'],
      properties['apparentTemperature']
    )
  end
end