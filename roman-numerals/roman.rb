# Work in progress
class Fixnum
  def to_roman
    romans = { 1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX',10 => 'X', 40 => 'XL', 50 => 'L', 90 => 'XC',100 => 'C', 400 => 'CD', 500 => 'D', 900 => 'CM',1000 => 'M' }

    number = self
    decimals = romans.keys
    output = ""

    while number > 0
      max = decimals.find_all { |d| d <= number }.max
      number -= max
      output << romans[max]
    end

    output
  end
end
