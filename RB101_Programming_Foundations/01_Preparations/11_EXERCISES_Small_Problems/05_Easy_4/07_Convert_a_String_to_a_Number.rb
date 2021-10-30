=begin

The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

Examples

string_to_integer('4321') == 4321
string_to_integer('570') == 570

=end

def string_to_integer(str)
  int = 0
  place = 1
  str.reverse.split('').each do |num|

    case num
    when '1' then digit = 1
    when '2' then digit = 2
    when '3' then digit = 3
    when '4' then digit = 4
    when '5' then digit = 5
    when '6' then digit = 6
    when '7' then digit = 7
    when '8' then digit = 8
    when '9' then digit = 9
    when '0' then digit = 0
    end

    int += digit * place
    place *= 10
  end

  int
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
