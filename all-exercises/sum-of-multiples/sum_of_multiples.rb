
class SumOfMultiples
  def initialize(*input)
    @multiples = input
  end

  def to(last)
    SumOfMultiples.to(last, @multiples)
  end

  def self.to(last, multi = [3, 5])
    range = Array(0...last)

    match = range.select do |n|
      multi.any? { |j| n % j == 0 }
    end

    match.inject(:+)
  end
end
