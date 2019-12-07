=begin

If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

Example:

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

=end

def rotate_array(array)
  output = []
  1.upto(array.size - 1) do |index|
    output << array[index]
  end
  output << array[0]
end

def rotate_rightmost_digits(int_1, int_2)
  string_rep = int_1.to_s
  untouched = string_rep[0..-int_2 - 1]
  rotated = rotate_array(string_rep[-int_2..-1]).join
  (untouched + rotated).to_i
end

def max_rotation(int)
  current_int = int
  int.to_s.length.downto(2) { |x| current_int = rotate_rightmost_digits(current_int, x) }
  current_int
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
