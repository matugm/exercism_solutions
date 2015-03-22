require 'benchmark/ips'
require './raindrops.rb'

NUMBER = 300

Benchmark.ips do |x|
  x.report("My code") { Raindrops.convert(NUMBER) }
  x.compare!
end
