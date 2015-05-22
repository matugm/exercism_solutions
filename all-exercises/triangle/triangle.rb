
class TriangleError < StandardError; end

class Triangle

  def initialize(*sides)
    @sides = sides

    raise TriangleError if invalid_triangle?
  end

  def kind
    if all_sides_equal?
      :equilateral
    elsif all_sides_different?
      :scalene
    else
      :isosceles
    end
  end

  private

  def invalid_triangle?
    @sides.any? { |s| s <= 0 }
  end

  def all_sides_equal?
    @sides.all? { |s| s == @sides.first }
  end

  def all_sides_different?
    @sides[0] != @sides[1] &&
    @sides[1] != @sides[2] &&
    @sides[0] != @sides[2]
  end
end
