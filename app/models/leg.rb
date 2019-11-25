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


  # This is a very un-dry method that mimics an exponential equation
  # When the equation is developed, it will replace this placeholder method
  def adjusted_distance
    # A 1:1 slope will require tenfold the fuel of no slope at all
    if elevation_grade >= 1.0
      path_punishment * 10
    elsif elevation_grade < 1 && elevation_grade > 0.90
      path_punishment * 8
    elsif elevation_grade < 0.90 && elevation_grade > 0.80
      path_punishment * 5
    elsif elevation_grade < 0.80 && elevation_grade > 0.70
      path_punishment * 3.5
    elsif elevation_grade < 0.70 && elevation_grade > 0.60
      path_punishment * 2.9
    elsif elevation_grade < 0.60 && elevation_grade > 0.50
      path_punishment * 2.6
    elsif elevation_grade < 0.50 && elevation_grade > 0.40
      path_punishment * 2.3
    elsif elevation_grade < 0.40 && elevation_grade > 0.30
      path_punishment * 1.8
    elsif elevation_grade < 0.30 && elevation_grade > 0.20
      path_punishment * 1.5
    elsif elevation_grade < 0.20 && elevation_grade > 0.10
      path_punishment * 1.2
    elsif elevation_grade < 0.10 && elevation_grade > 0.00
      path_punishment * 1.06
    # If there is a negative slope in the grade, there will be fuel savings!
    elsif elevation_grade == -1
      path_punishment / 10
    elsif elevation_grade > -1 && elevation_grade < -0.90
      path_punishment / 8
    elsif elevation_grade > -0.90 && elevation_grade < -0.80
      path_punishment / 5
    elsif elevation_grade > -0.80 && elevation_grade < -0.70
      path_punishment / 3.5
    elsif elevation_grade > -0.70 && elevation_grade < -0.60
      path_punishment / 2.9
    elsif elevation_grade > -0.60 && elevation_grade < -0.50
      path_punishment / 2.6
    elsif elevation_grade > -0.50 && elevation_grade < -0.40
      path_punishment / 2.3
    elsif elevation_grade > -0.40 && elevation_grade < -0.30
      path_punishment / 1.8
    elsif elevation_grade > -0.30 && elevation_grade < -0.20
      path_punishment / 1.5
    elsif elevation_grade > -0.20 && elevation_grade < -0.10
      path_punishment / 1.2
    elsif elevation_grade > -0.10 && elevation_grade < -0.00
      path_punishment / 1.06
    else
      path_punishment
    end
  end
end
