class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.integer :miles_per_gallon
      t.integer :fuel_on_vehicle
      t.integer :user_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
