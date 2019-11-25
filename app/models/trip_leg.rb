class TripLeg < ApplicationRecord
  belongs_to :trip
  belongs_to :leg
end
