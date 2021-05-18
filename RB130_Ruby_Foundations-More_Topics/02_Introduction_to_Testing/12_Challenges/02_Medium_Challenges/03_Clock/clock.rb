class Clock
  attr :hours, :minutes

  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def initialize(hours, minutes=0)
    @hours = hours
    @minutes = minutes
  end

  def +(minutes)
    @minutes += minutes
    until @minutes < 60
      @hours += 1
      @minutes -= 60
    end
    @hours -= 24 until @hours < 24

    self
  end

  def -(minutes)
    @minutes -= minutes
    until @minutes.positive?
      @hours -= 1
      @minutes += 60
    end
    @hours += 24 until @hours.positive?

    self
  end

  def to_s
    "#{@hours.to_s.rjust(2, "0")}:#{@minutes.to_s.rjust(2, "0")}"
  end

  def ==(other)
    @hours == other.hours && @minutes == other.minutes
  end
end

puts (110 + 30).divmod(60)