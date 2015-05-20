
class Nucleotide
  def self.from_dna(str)
    raise ArgumentError unless str.match(/^[ATCG]+$/) or str.empty?
    str
  end
end

class String
  def histogram
    base = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }

    each_char do |c|
      base[c] += 1
    end

    base
  end
end
