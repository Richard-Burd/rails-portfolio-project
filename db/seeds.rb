# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: "ah@my.ai", username: "Ahmed", password: "pw1")
User.create!(email: "beh@my.ai", username: "Behati", password: "pw2")
User.create!(email: "car@my.ai", username: "Charles", password: "pw3")

# Now I'm going to create a trip specifically to test the math; this trip will have nice round numbers
Leg.create!(description: "First Test Leg", distance: 100, altitude_change: 0, terrain: "paved_road", user_id: 1) # leg 1
Leg.create!(description: "Second Test Leg", distance: 100, altitude_change: 0, terrain: "paved_road", user_id: 1) # leg 2

Trip.create!(name: "Numbers Tester", start_location: "Mile Zero", finish_location: "Mile One-Hundred", total_fuel_actually_consumed: nil) # trip 1

TripLeg.create!(trip_id: 1, leg_id: 1)
TripLeg.create!(trip_id: 1, leg_id: 2)

Vehicle.create!(name: "Subaru SUV", miles_per_gallon: 20, fuel_on_vehicle: 10, user_id: 1, trip_id: 1)
Vehicle.create!(name: "Ford SUV", miles_per_gallon: 20, fuel_on_vehicle: 10, user_id: 1, trip_id: 1)

# This is the next trip, its vehicles are owned by Behati
Leg.create!(description: "HWY N5 Eastbound to pass", distance: 52, altitude_change: 1200, terrain: "paved_road", user_id: 2) # leg 3
Leg.create!(description: "HWY N5 Eastbound from pass", distance: 55, altitude_change: -3120, terrain: "paved_road", user_id: 2) # leg 4

Trip.create!(name: "Souq Masourah Pass", start_location: "Sana'a", finish_location: "Marib", total_fuel_actually_consumed: nil) # trip 2

TripLeg.create!(trip_id: 2, leg_id: 3)
TripLeg.create!(trip_id: 2, leg_id: 4)

Vehicle.create!(name: "IFV LAV-25", miles_per_gallon: 9, fuel_on_vehicle: 20, user_id: 2, trip_id: 2)
Vehicle.create!(name: "Ural-375", miles_per_gallon: 3, fuel_on_vehicle: 17, user_id: 2, trip_id: 2)
Vehicle.create!(name: "FAW semi-trailer truck", miles_per_gallon: 7, fuel_on_vehicle: 92, user_id: 2, trip_id: 2)

# This trip has the first two legs of trip #2, but it has an additional 2 legs.)
Leg.create!(description: "HWY N5 High Desert Run (West of Al-Abr)", distance: 123, altitude_change: 930, terrain: "paved_road", user_id: 2) # leg 5
Leg.create!(description: "Al-Abr to UN Compound", distance: 18, altitude_change: 0, terrain: "off_road", user_id: 2) # leg 6

Trip.create!(name: "Airport to Hadhramaut Supply", start_location: "Sana'a Int'l Airport", finish_location: "UN Compound at Al-Abr", total_fuel_actually_consumed: nil) # trip 3


TripLeg.create!(trip_id: 3, leg_id: 3)
TripLeg.create!(trip_id: 3, leg_id: 4)
TripLeg.create!(trip_id: 3, leg_id: 5)
TripLeg.create!(trip_id: 3, leg_id: 6)

Vehicle.create!(name: "GAZ Tigr-21", miles_per_gallon: 15, fuel_on_vehicle: 11, user_id: 1, trip_id: 3)
Vehicle.create!(name: "Mercedes-Benz Arocs", miles_per_gallon: 9, fuel_on_vehicle: 32, user_id: 2, trip_id: 3)
Vehicle.create!(name: "Bushmaster PMV", miles_per_gallon: 13, fuel_on_vehicle: 12, user_id: 2, trip_id: 3)

# This is the fourth convoy
Leg.create!(description: "HWY N5 High Desert Run (Eest of Al-Abr)", distance: 86, altitude_change: -520, terrain: "paved_road", user_id: 2) # leg 7
Leg.create!(description: "HWY N5 Eastbound to E5", distance: 132, altitude_change: 4720, terrain: "dirt_road", user_id: 2) # leg 8

Trip.create!(name: "Marib Through Hadhramaut", start_location: "Marib", finish_location: "Fugmah", total_fuel_actually_consumed: nil) # trip 4

TripLeg.create!(trip_id: 4, leg_id: 5)
TripLeg.create!(trip_id: 4, leg_id: 6)
TripLeg.create!(trip_id: 4, leg_id: 7)
TripLeg.create!(trip_id: 4, leg_id: 8)

Vehicle.create!(name: "LAV-16", miles_per_gallon: 16, fuel_on_vehicle: 17, user_id: 3, trip_id: 4)
Vehicle.create!(name: "Mercedes-Benz Axor", miles_per_gallon: 8, fuel_on_vehicle: 20, user_id: 2, trip_id: 4)
Vehicle.create!(name: "Mercedes-Benz Atego", miles_per_gallon: 7, fuel_on_vehicle: 17, user_id: 3, trip_id: 4)
