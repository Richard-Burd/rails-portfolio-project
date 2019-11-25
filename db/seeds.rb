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
Leg.create!(description: "First Test Leg", distance: 100, altitude_change: 0, terrain: "paved_road", user_id: 1)
Leg.create!(description: "Second Test Leg", distance: 100, altitude_change: 0, terrain: "paved_road", user_id: 1)

Trip.create!(name: "Numbers Tester", start_location: "Mile Zero", finish_location: "Mile One-Hundred", total_fuel_actually_consumed: nil)

TripLeg.create!(trip_id: 1, leg_id: 1)
TripLeg.create!(trip_id: 1, leg_id: 2)

Vehicle.create!(name: "Trailer", miles_per_gallon: 20, fuel_on_vehicle: 10, user_id: 1, trip_id: 1)
Vehicle.create!(name: "Ford SUV", miles_per_gallon: 20, fuel_on_vehicle: 10, user_id: 1, trip_id: 1)
