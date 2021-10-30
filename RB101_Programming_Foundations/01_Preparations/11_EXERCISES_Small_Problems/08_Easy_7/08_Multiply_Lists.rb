=begin

Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

Examples:

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

=end

=begin
def multiply_list(arr_1, arr_2)
  new_arr = []
  arr_1.each_with_index { |value, index| new_arr << value * arr_2[index] }
  new_arr
end
=end

def multiply_list(arr_1, arr_2)
  arr_1.zip(arr_2).map { |array| array[0] * array[1] }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
