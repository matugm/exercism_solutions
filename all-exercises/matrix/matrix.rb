class Matrix
  attr_reader :rows

  def initialize(input)
    @rows = input.split("\n").map { |str| find_numbers(str) }
  end

  def find_numbers(str)
    str.scan(/\d+/).map { |n| n.to_i }
  end

  def fetch_column(n)
    @rows.each_with_object([]) { |row, memo| memo << row[n] }
  end

  def columns
    (0...@rows.size).each_with_object([]) { |i, memo| memo << fetch_column(i) }
  end
end
