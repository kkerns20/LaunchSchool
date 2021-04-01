module Armorable
  def attach_armor
    # implementation omitted
  end

  def remove_armor
    # implementation omitted
  end
end

module Castable
  def cast_spell(spell)
    # implementation omitted
  end
end

class Player
  attr_accessor :health
  attr_reader :str, :int, :name

  def initialize(name)
    @name = name
    @health = 100
    @str = roll_dice.freeze # Strength
    @int = roll_dice.freeze # Intelligence
  end

  def heal(num)
    self.health = health + num
  end

  def hurt(num)
    self.health = health - num
  end

  def to_s
    puts "Name: #{name}"
    puts "Class: #{self.class}"
    puts "Health: #{health}"
    puts "Strength: #{str}"
    puts "Inteligence: #{int}" # typo here part of exam specification
  end

  private

  def roll_dice
    rand(1..6) + rand(1..6)
  end
end

class Warrior < Player
  include Armorable

  @class = self
  def initialize(name)
    super
    @str += 2
  end
end

class Paladin < Player
  include Armorable
  include Castable
  
  def initialize(name)
    super
  end
end

class Magician < Player
  include Castable

  def initialize(name)
    super
    @int += 2
  end
end


class Bard < Magician # This line constitutes the revision I was prompted to make by the TA
  def initialize(name)
    super
  end

  def create_potion
    # implementation omitted
  end
end

justin = Bard.new('Justin')
puts justin
