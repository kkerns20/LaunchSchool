=begin

Write a method that takes an array as an argument, and a block that returns true or false depending on the value of the array element passed to it. The method should return a count of the number of times the block returns true.

You may not use Array#count or Enumerable#count in your solution.

Examples:

count([1,2,3,4,5]) { |value| value.odd? } == 3
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
count([1,2,3,4,5]) { |value| true } == 5
count([1,2,3,4,5]) { |value| false } == 0
count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2

=end

def count(array)
  total_true = 0

  array.each do |item|
    total_true += 1 if yield item
  end

  total_true
end

puts count([1,2,3,4,5]) { |value| value.odd? } == 3
puts count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts count([1,2,3,4,5]) { |value| true } == 5
puts count([1,2,3,4,5]) { |value| false } == 0
puts count([]) { |value| value.even? } == 0
puts count(%w(Four score and seven)) { |value| value.size == 5 } == 2

def other_count(array)
  array.map { |item| (yield item) ? 1 : 0 }.sum
end

puts other_count([1,2,3,4,5]) { |value| value.odd? } == 3
puts other_count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts other_count([1,2,3,4,5]) { |value| true } == 5
puts other_count([1,2,3,4,5]) { |value| false } == 0
puts other_count([]) { |value| value.even? } == 0
puts other_count(%w(Four score and seven)) { |value| value.size == 5 } == 2
