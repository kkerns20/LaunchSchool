=begin

In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

Examples

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

=end

def integer_to_string(int)
  integers = {
    1 => '1',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9',
    0 => '0'
  }

  string = ''
  until int % 10 == int do
    string += integers[int % 10]
    int /= 10
  end

  (string + integers[int]).reverse
end

def signed_integer_to_string(int)
  number = integer_to_string(int.abs)
  return '+' + number if int > 0
  return '-' + number if int < 0
  '0'
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
