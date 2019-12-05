=begin

Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

Example:

square(5) == 25
square(-8) == 64

=end

def square(int)
  int * int
end

puts square(5) == 25
puts square(-8) == 64
