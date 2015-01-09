class Threecast < Sinatra::Base
  set :views, "#{settings.root}/app/views"

  get '/' do
    erb :index
  end
end