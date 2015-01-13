module ApplicationHelper
  def self.delete_all_forecasts
    Forecast.delete_all
  end

  def self.update_all_forecasts
    Location.update_all_forecasts
  end
end

helpers ApplicationHelper