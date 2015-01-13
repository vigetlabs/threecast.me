Bundler.require

class Threecast < Sinatra::Base
  set :views, "#{settings.root}/app/views"

  set :assets_css_compressor, :sass
  set :assets_precompile, %w(application.css)
  set :assets_prefix, %w(app/assets)

  set :forecast_io_api_key, ENV['FORECAST_IO_API_KEY'] || YAML.load(File.open('config/forecast_io.yml'))['api_key']

  register Sinatra::ActiveRecordExtension
  register Sinatra::AssetPipeline
end

Dir.glob('./app/**/*.rb', &method(:require))