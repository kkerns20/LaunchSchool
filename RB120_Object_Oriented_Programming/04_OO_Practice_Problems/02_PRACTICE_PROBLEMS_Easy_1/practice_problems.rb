#Exercises for Section 4 - 'Practice Problems: Easy 1'

#1 - Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?

puts true.object_id
puts "hello".object_id
puts [1, 2, 3, "happy days"].object_id
puts 142.object_id

# All of the above have object IDs, therefore all are objects

#2 - If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed? How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

Car.new.go_fast

#3 - In the last question we had a module called Speed which contained a go_fast method. We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

# When we called the go_fast method from an instance of the Car class (as shown below) you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

small_car = Car.new
small_car.go_fast == "I am a Car and going super fast!"

# When used within an instance method definition, self refers to the calling object.

#4 - If we have a class AngryCat how do we create a new instance of this class?

# The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

p AngryCat.new

#5 - Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# name is the instance variable for Pizza class objects. Ruby denotes instance variables with the @ prefix

#6 - What could we add to the class below to access the instance variable @volume?

class Cube
  attr_accessor :volume

  def initialize(volume)
    @volume = volume
  end
end

rubik = Cube.new(8)
puts rubik.volume
rubik.volume = 27
puts rubik.volume

#7 - What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?

# By default, to_s will return the object's proximal class name as well as an encoded representation of its memory address.

#8 - If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self. What does self refer to here?

# self refers to the instance of a Cat class object that make_one_year_older is called against.

#9 - If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# In the name of the cats_count method we have used self. What does self refer to in this context?

# Here, self refer to the collection of objects which have inherited from the Cat class. This collection can be empty.

# 10 - If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

louis = Bag.new('Brown', "Leather")
