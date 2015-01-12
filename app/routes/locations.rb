class Threecast < Sinatra::Base
  get '/locations/:slug' do
    if @location = settings.locations[params[:slug]]
      ForecastIO.api_key = settings.forecast_io_api_key

      @forecast = ForecastIO.forecast(@location['lat'], @location['lng'])

      erb :'locations/show'
    else
      404
    end
  end
end