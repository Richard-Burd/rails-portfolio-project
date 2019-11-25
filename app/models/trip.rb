class Trip < ApplicationRecord

  has_many :vehicles
  has_many :users, through: :vehicles
  has_many :trip_legs
  has_many :legs, through: :trip_legs

  validates :name, presence: true
  validates :start_location, presence: true
  validates :finish_location, presence: true
  validates_numericality_of :total_fuel_actually_consumed, greater_than: 0, allow_nil: true

  # The sum of all fuel on all vehicles in the convoy
  def total_fuel_on_hand
    total = []
    self.vehicles.each do |vehicle|
      total << vehicle.fuel_on_vehicle
    end
    total.sum
  end

  # This is the amount of fuel the convoy needs to go 1 mile
  def convoy_fuel_req_for_1_mile
    total = []
      self.vehicles.each do |vehicle|
        total << 1.0 / vehicle.miles_per_gallon
    end
    total.sum
  end

  # This is the total distance of the trip when adjusted for elevation gain
  # (or loss) as well as road conditions.  A 12 mile flat stretch of paved off_road
  # would equal 12 miles of distance.  A 12 mile uphill stretch of dirt road will
  # be something greater than 12 miles. A 12 mile downhill stretch of paved off_road
  # would be something less than 12 miles.
  def total_adjusted_distance
    total = []
    self.legs.each do |leg|
      total << leg.adjusted_distance
    end
    total.sum
  end

  def total_fuel_req_for_trip
    convoy_fuel_req_for_1_mile * total_adjusted_distance
  end

  # The difference between how much fuel you need and how much you have
  def fuel_difference
    total_fuel_on_hand - total_fuel_req_for_trip
  end

end
