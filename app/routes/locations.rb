class Threecast < Sinatra::Base
  get '/locations' do
    redirect to('/')
  end

  get '/locations/:slug' do
    @location = Location.where(slug: params[:slug]).first

    if @location
      erb :'locations/show'
    else
      404
    end
  end
end