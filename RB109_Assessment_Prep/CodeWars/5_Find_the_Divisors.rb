# Create a function named divisors/Divisors that takes an integer n > 1 and returns an array with all of the integer's divisors(except for 1 and the number itself),
# from smallest to largest. If the number is prime return the string '(integer) is prime' (null in C#) (use Either String a in Haskell and Result<Vec<u32>,
# String> in Rust).

# Example:
# divisors(12); // should return [2,3,4,6]
# divisors(25); // should return [5]
# divisors(13); // should return "13 is prime"

def divisors(int)
  
  # instantiate factor list = []
  # starting with int, interate downward, checking for modulus int and current number
    # if zero, add to list of factors
    # else nothing
    # halt at 1
  # return "#{int} is prime" if factor list.size = 0
  # sort array

  factors = []
  (int - 1).downto(2) do |number|
    factors << number if int % number == 0
  end

  return "#{int} is prime" if factors.size == 0

  factors.sort
  
end

puts divisors(12) == [2,3,4,6]
puts divisors(25) == [5]
puts divisors(13) == "13 is prime"
