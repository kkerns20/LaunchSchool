module Towable
  def can_tow?(lbs)
    lbs < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year

  @@vehicle_count = 0

  def self.count_vehicles
    puts "The total number of vehicles is #{vehicle_count}."
  end

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @@vehicle_count += 1
  end

  def speed_up(mph)
    @speed += mph
    puts "Speed increased to #{@speed} mph."
  end

  def brake(mph)
    @speed -= mph
    puts "Speed reduced to #{@speed} mph."
  end

  def turn_off
    @speed = 0
    puts "Speed reduced to #{@speed} mph. Car shuts off."
  end

  def spray_paint(color)
    self.color = color
  end

  def to_s
    puts "This car is a/n #{@color} #{@year} #{@model}."
  end

  def self.gas_mileage(miles, gallons)
    puts "Cars like this get #{miles.to_f / gallons} miles per gallon of gas."
  end

  def age
    "Your #{@model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  CYLINDERS = 4
end

class MyTruck
  include Towable

  CYLINDERS = 8
end

accord = MyCar.new(2004, 'Silver', 'Accord')
accord.speed_up(10)
accord.speed_up(50)
accord.brake(40)
accord.brake(30)
accord.turn_off
accord.color = 'Baby Blue'
puts accord.color
puts accord.year
accord.spray_paint 'Red'
puts accord.color
MyCar.gas_mileage(35, 20)
accord.to_s
puts accord.age

#puts MyCar.ancestors
#puts MyTruck.ancestors
#puts Vehicle.ancestors
