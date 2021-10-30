=begin

Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

Example

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

=end

def merge(array_1, array_2)
  result = []
  (array_1 + array_2).each { |value| result << value if !result.include?(value) }
  result
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
