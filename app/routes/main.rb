class Threecast < Sinatra::Base
  get '/' do
    @locations = settings.locations

    erb :index
  end

  not_found do
    erb :'404'
  end
end