class Threecast < Sinatra::Base
  scheduler = Rufus::Scheduler.new

  scheduler.every '15m' do
    ThreecastHelpers.update_all_forecasts
  end

  scheduler.cron '3 0 * * *' do
    ThreecastHelpers.delete_all_forecasts
    ThreecastHelpers.update_all_forecasts
  end
end