#Exercises for Section 4 - 'Practice Problems: Easy 2'

#1 - You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of calling

oracle = Oracle.new
p oracle.predict_the_future

# One of three randomly generated sentences.

#2 - We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

# One of three randomly generated sentences about traveling.

#3 - How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange and HotSauce?

# Ruby first looks in the class definition of the calling object (unless redirected by ::), then in the modules for that object, then in the inherited class, its modules, etc.

Orange.ancestors
HotSauce.ancestors

#4 - What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

class BeesWax
  # New
  attr_accessor :type

  def initialize(type)
    @type = type
  end

=begin
  def type
    @type
  end

  def type=(t)
    @type = t
  end
=end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

#5 - There are a number of variables listed below. What are the different types and how do you know which is which?

=begin
excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"
=end

# @@ indicates a class variable. It is shared by all instances of that class and its descendents.
# @ indicates an instance variable. It is used only by one instance of an object.
# The final one is a method variable.

#6 - If I have the following class:

class Television
  def self.manufacturer
    p "Sony"
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would you call a class method?

# Class methods have 'self.' in the name declaration.

Television.manufacturer

#7 - If we have a class such as the one below:

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

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

# It counts the number of cat objects the computer created using the Cat class template.

p Cat.cats_count
tom = Cat.new('Tabby')
p Cat.cats_count
rat = Cat.new('Sphinx')
p Cat.cats_count

#8 - If we have this class:

class Game
  def play
    "Start the game!"
  end
end

# And another class:

class Bingo
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo class to allow it to inherit the play method from the Game class?

# append ' << Game' to the Bingo class name declaration

#9 - If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that
# the Bingo class inherits from.

# When an instance of Bingo calls that method, it will find and execute the version in the Bingo class body, ignoring the version in Game.

# 10 - What are the benefits of using Object Oriented Programming in Ruby? Think of as many as you can.

# Compartmentalization, ease of reading, logically simpler