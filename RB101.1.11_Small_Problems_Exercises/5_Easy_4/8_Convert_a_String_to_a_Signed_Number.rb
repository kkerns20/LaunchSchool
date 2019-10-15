=begin

In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

Examples

string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

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

def string_to_signed_integer(str)
  return -1 * string_to_integer(str.tr('+-', '')) if str.start_with?('-')
  string_to_integer(str.tr('+-', ''))
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
