class CreateLegs < ActiveRecord::Migration[6.0]
  def change
    create_table :legs do |t|
      t.string :description
      t.string :terrain
      t.integer :distance
      t.integer :altitude_change
      t.integer :user_id

      t.timestamps
    end
  end
end
