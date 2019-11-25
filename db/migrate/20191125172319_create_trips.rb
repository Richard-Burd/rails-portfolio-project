class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :convoy_log
      t.string :start_location
      t.string :finish_location
      t.integer :total_fuel_actually_consumed

      t.timestamps
    end
  end
end
