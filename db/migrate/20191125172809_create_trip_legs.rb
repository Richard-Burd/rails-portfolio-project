class CreateTripLegs < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_legs do |t|
      t.integer :trip_id
      t.integer :leg_id

      t.timestamps
    end
  end
end
