
class Clock
  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours   = hours
    @minutes = minutes
  end

  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end

  def to_s
    "#{pad(@hours)}:#{pad(@minutes)}"
  end

  def ==(other)
    @hours == other.hours && @minutes == other.minutes
  end

  def pad(num)
    "%02d" % num
  end

  def -(minutes)
    @minutes -= minutes % 60
    @minutes = @minutes.abs

    extra_hours = (@minutes + minutes) / 60
    @hours -= extra_hours

    @hours = 24 - extra_hours if @hours < 0

    self
  end

  def +(minutes)
    @minutes += minutes % 60

    extra_hours = (@minutes + minutes) / 60
    @hours += extra_hours

    @hours = 0 if @hours > 23

    self
  end
end
