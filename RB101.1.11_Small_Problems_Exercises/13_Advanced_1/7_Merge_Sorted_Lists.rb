=begin
  
Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

Examples:

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

=end

def merge(sorted_arr_1, sorted_arr_2)
  input = [] << sorted_arr_1 << sorted_arr_2
  output = []
  until input[0].size == 0 || input[1].size == 0 do
    if input[0].first < input[1].first
      output << input[0].shift
    else
      output << input[1].shift
    end
  end
  output << input[0] << input[1]
  output.flatten
end

array = [1, 5, 9]
puts array.object_id
puts merge(array, [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge([], [1, 4, 5]) == [1, 4, 5]
puts merge([1, 4, 5], []) == [1, 4, 5]
puts array.object_id