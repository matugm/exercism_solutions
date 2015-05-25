
class SpaceAge
  attr_reader :seconds

  EARTH_YEAR = 31557600.0

  def initialize(seconds)
    @seconds = seconds
  end

  def calculate_year(multiplier)
    @seconds / (EARTH_YEAR * multiplier)
  end

  def on_earth
    calculate_year 1
  end

  def on_mercury
    calculate_year 0.2408467
  end

  def on_venus
    calculate_year 0.61519726
  end

  def on_mars
    calculate_year 1.8808158
  end

  def on_jupiter
    calculate_year 11.862615
  end

  def on_saturn
    calculate_year 29.447498
  end

  def on_uranus
    calculate_year 84.016846
  end

  def on_neptune
    calculate_year 164.79132
  end
end
