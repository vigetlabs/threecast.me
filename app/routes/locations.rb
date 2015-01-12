class Threecast < Sinatra::Base
  get '/locations' do
    redirect to('/')
  end

  get '/locations/:slug' do
    @location = Location.where(slug: params[:slug]).first

    if @location
      ForecastIO.api_key = settings.forecast_io_api_key
      @forecast = ForecastIO.forecast(@location.lat, @location.lng)

      erb :'locations/show'
    else
      404
    end
  end
end