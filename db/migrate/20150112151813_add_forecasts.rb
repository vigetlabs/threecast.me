class AddForecasts < ActiveRecord::Migration
  def up
    create_table :forecasts do |t|
      t.json       :forecast_json, null: false
      t.belongs_to :location

      t.timestamps
    end
  end

  def down
    drop_table :forecasts
  end
end
