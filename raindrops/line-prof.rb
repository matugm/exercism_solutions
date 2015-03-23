require 'rblineprof'
require 'rblineprof-report'
require_relative 'raindrops'

target = /./ # or regular expression like /./
profile = lineprof(target) do
  10_000.times { Raindrops.convert 5000 }
end

LineProf.report(profile)
