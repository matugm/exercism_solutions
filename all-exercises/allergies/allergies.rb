
class Allergies
  attr_reader :list

  VALUES = {
            "cats" => 128,
          "pollen" => 64,
       "chocolate" => 32,
        "tomatoes" => 16,
    "strawberries" => 8,
       "shellfish" => 4,
         "peanuts" => 2,
            "eggs" => 1
  }

  def initialize(score)
    @score = score
    @list  = create_list
  end

  def create_list
    list = []

    VALUES.each do |k, v|
      next if v > @score || @score % v < 0

      @score %= v
      list << k
    end

    list.reverse
  end

  def allergic_to?(name)
    @list.include? name
  end
end
