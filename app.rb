Bundler.require

class Threecast < Sinatra::Base
  set :views, "#{settings.root}/app/views"

  set :assets_css_compressor, :sass
  set :assets_precompile, %w(application.css)
  set :assets_prefix, %w(app/assets)

  register Sinatra::ActiveRecordExtension
  register Sinatra::AssetPipeline
end

Dir.glob('./app/**/*.rb', &method(:require))