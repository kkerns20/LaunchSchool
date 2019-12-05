=begin

Write the following methods so that each output is true.

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36

=end

def add(first_number, second_number)
    first_number + second_number
end

def multiply(first_number, second_number)
    first_number * second_number
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36