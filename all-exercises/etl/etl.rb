class ETL
  # input format: {1=>["A", "E"], 2=>["D", "G"]}
  def self.transform(input)
    input.keys.each_with_object({}) do |key, hash|
      input[key].each { |v| hash[v.downcase] = key }
    end
  end
end
