require 'sinatra/activerecord/rake'
require 'sinatra/asset_pipeline/task'
require './app'

Sinatra::AssetPipeline::Task.define! Threecast

desc 'Update forecasts for all locations'
task :update_all_forecasts do
  Location.update_all_forecasts
end