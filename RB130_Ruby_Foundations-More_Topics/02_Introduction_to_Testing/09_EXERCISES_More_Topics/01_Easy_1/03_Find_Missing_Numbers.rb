=begin

Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

Examples:

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

=end

def missing(array_of_ints)
  start_val = array_of_ints.shift
  end_val = array_of_ints.pop
  return [] if start_val == nil || end_val == nil
  output = []

  (start_val + 1).upto(end_val - 1) do |int|
    output << int unless array_of_ints.include?(int)
  end

  output
end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []
