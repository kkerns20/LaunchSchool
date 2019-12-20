class GoodDog
  attr_accessor :name, :height, :weight, :age
  @@number_of_dogs = 0
  DOG_YEARS = 7

  def initialize(n, h, w, a)
    @name = n
    @height = h
    @weight = w
    self.age = a * DOG_YEARS

    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w, a)
    self.name = n
    self.height = h
    self.weight = w
    self.age = a * DOG_YEARS
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall. They are #{age} dog years old."
  end

  def self.what_am_i
    "I'm a GoodDog class!"
  end
end

puts GoodDog.total_number_of_dogs

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs', 1)
puts sparky.info

sparky.change_info('Spartacus', '24 inches', '45 lbs', 4)
puts sparky.info

puts GoodDog.what_am_i
puts GoodDog.total_number_of_dogs