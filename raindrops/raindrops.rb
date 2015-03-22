require 'prime'

class Raindrops
  def self.convert(input)
    mapping =  { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }
    factors = Prime.prime_division(input)

    factors.map! do |prime, _|
      mapping.fetch(prime, '')
    end

    output = factors.join
    output == "" ? input.to_s : output
  end
end
