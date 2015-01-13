class Threecast < Sinatra::Base
  scheduler = Rufus::Scheduler.new

  scheduler.every '15m' do
    ApplicationHelper.update_all_forecasts
  end

  scheduler.cron '3 0 * * *' do
    ApplicationHelper.delete_all_forecasts
    ApplicationHelper.update_all_forecasts
  end
end