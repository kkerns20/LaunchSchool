=begin

We want to iterate through the numbers array and return a new array containing only the even numbers. However, our code isn't producing the expected output. Why not? How can we change it to produce the expected result?
=end

numbers = [5, 2, 9, 6, 3, 1, 8]

=begin
even_numbers = numbers.map do |n|
  n if n.even?
end

p even_numbers # expected output: [2, 6, 8]

=end

even_numbers = numbers.select do |n|
    n if n.even?
end
  
p even_numbers # expected output: [2, 6, 8]

# the map function is 1 to 1 mapping of an index to a function of the return of a transformation on the value.