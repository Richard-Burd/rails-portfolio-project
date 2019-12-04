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
  # It is represented in the y axis below
  def elevation_grade
    (self.altitude_change / (self.distance * 5280.0))
  end

  # This polyline function was developed on geogebra.org here:
  # https://www.geogebra.org/m/wxsaesvw
  def graphed_function_1(x)
    # the polynomial equation as copied from geogebra.org:
    # f(x) = 0x4 + 1.87x3 - 0x2 + 0.11x
    # simplified form:
    1.87*x**3 + 0.11*x
  end

  # This will return a value for x [the slope] for different y [fuel] inputs
  def elevation_punishment
    graphed_function_1(elevation_grade)
  end

  # This is the distance you are traveling when factoring in elevation change
  # and terrain conditions
  def adjusted_distance
    self.path_punishment + self.elevation_punishment.floor
  end
end
