class Vehicle < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :name, presence: true
  validates_numericality_of :miles_per_gallon, greater_than: 0
  validates_numericality_of :fuel_on_vehicle, greater_than: 0
end
