class Threecast < Sinatra::Base
  get '/' do
    @locations = Location.all

    erb :index
  end

  not_found do
    erb :'404'
  end
end