require 'benchmark/ips'
require_relative 'hamming'

Benchmark.ips do |x|
  x.report ("with") { Hamming.compute("hellothere", "halluthore") }
  x.report ("no if") { Hamming.compute_no_if("hellothere", "halluthore") }
  x.compare!
end

Benchmark.ips do |x|
  x.report ("with") { Hamming.compute("hellothere", "hellothere") }
  x.report ("no if") { Hamming.compute_no_if("hellothere", "hellothere") }
  x.compare!
end
