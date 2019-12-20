#Exercises for Section 4 - 'Practice Problems: Easy 3'

#1 - If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1:

hello = Hello.new
hello.hi

# "Hello"

# case 2:

hello = Hello.new
#hello.bye

# NoMethod error

# case 3:

hello = Hello.new
#hello.greet

# Wrong number of arguments error

# case 4:

hello = Hello.new
hello.greet("Goodbye")

# 'Goodbye'

# case 5:

# Hello.hi

# NoMethod error

#2 - In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting

=begin
  def self.hi
    greeting = Greeting.new
    greeting.greet('This is my class method!')
  end
=end

  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?

#3 - When objects are created they are a separate realization of a particular class.

# Given the class below, how do we create two different instances of this class, both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

tabby = AngryCat.new(1, "Tabby")
tom = AngryCat.new(2, "Tom")

#4 - Given the class below, if we created a new instance of the class and then called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

class Cat
  def initialize(type)
    @type = type
  end

  # Solution
  def to_s
    "I am a #{@type} cat?"
  end
end

# How could we go about changing the to_s output on this method to look like this: I am a tabby cat?
# (this is assuming that "tabby" is the type we passed in during initialization).

cat = Cat.new("Tabby")
puts cat

#5 - If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new # instantiates new television object
#tv.manufacturer # undefined method (class should be caller, not object)
tv.model # model method logic executes

Television.manufacturer # manufacturer class method logic executes
#Television.model # undefined method (object should be caller, not class)

#6 - If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    #self.age += 1
    @age += 1
  end
end

# In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?

#7 - What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    # the return method call is superfluous
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end
