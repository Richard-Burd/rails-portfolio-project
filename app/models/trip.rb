class Trip < ApplicationRecord

  has_many :vehicles
  has_many :users, through: :vehicles
  has_many :trip_legs
  has_many :legs, through: :trip_legs

  validates :name, presence: true
  validates :start_location, presence: true
  validates :finish_location, presence: true

end
