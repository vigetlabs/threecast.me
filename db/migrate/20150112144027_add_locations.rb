class AddLocations < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      t.text :name, null: false
      t.text :slug, null: false
      t.text :lat, null: false
      t.text :lng, null: false

      t.timestamps
    end
  end

  def down
    drop_table :locations
  end
end
