class Location < ActiveRecord::Base
  validates :name, :slug, :lat, :lng, presence: true

  has_many :forecasts

  def forecast
    forecasts.last
  end

  def update_forecast
    Forecast.store(Forecast.request(self), self)
  end

  def self.update_all_forecasts
    all.each(&:update_forecast)
  end
end