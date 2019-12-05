=begin

Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

Examples:

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

=end

def running_total(array)
  run = 0
  new_array = []

  array.each do |x|
    run += x
    new_array << run
  end

  new_array
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
