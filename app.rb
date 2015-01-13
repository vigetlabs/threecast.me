Bundler.require

class Threecast < Sinatra::Base
  set :views, "#{settings.root}/app/views"

  set :assets_css_compressor, :sass
  set :assets_precompile, %w(application.css)
  set :assets_prefix, %w(app/assets)

  register Sinatra::ActiveRecordExtension
  register Sinatra::AssetPipeline

  Rufus::Scheduler.new.every '5m' do
    system 'bundle exec rake update_all_forecasts'
  end
end

Dir.glob('./app/**/*.rb', &method(:require))