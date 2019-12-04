class Leg < ApplicationRecord

  belongs_to :user
  has_many :trip_legs
  has_many :trips, through: :trip_legs

  validates :description, presence: true
  validates_numericality_of :altitude_change
  validates_numericality_of :distance, greater_than: 0

  # This validates that terrain is both present, and is one of the three options below:
  validates_inclusion_of :terrain, :in => ["paved_road", "dirt_road", "off_road"]

  # Fuel efficiency is lost on rugged terrain
  def path_punishment
    # This is here so the return value of this method is not "nil"
    if self.terrain == "paved_road"
      self.distance
    # 30% decrease in fuel efficiency on a dirt road
    elsif self.terrain == "dirt_road"
      self.distance * 1.30
    # 65% decrease in fuel efficiency on a dirt road
    elsif self.terrain == "off_road"
      self.distance * 1.65
    end
  end

  # This is the slope of the elevation gain or loss expressed as a decimal
  def elevation_grade
    (self.altitude_change / (self.distance * 5280.0))
  end

  def graphed_function_1(x)
    # 0*x**4 + 1.87*x**3 - 0*x**2 + 0.11*x
    1.87*x**3 + 0.11*x
  end

  def elevation_punishment
    graphed_function_1(elevation_grade)
  end

  def adjusted_distance
    self.path_punishment + self.elevation_punishment
  end
end
