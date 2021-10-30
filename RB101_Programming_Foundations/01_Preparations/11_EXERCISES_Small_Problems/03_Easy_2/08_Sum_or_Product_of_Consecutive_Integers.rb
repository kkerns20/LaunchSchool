=begin

Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

Examples:

>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

=end

def sum(int)
  total = 0
  int.times { |x| total += (x + 1) }
  return total
end

def factorial(int)
  total = 1
  int.times { |x| total *= (x + 1) }
  return total
end

puts ">> Please enter an integer greater than 0:"
integer = gets.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  puts "The sum of the integers between 1 and #{integer} is #{sum(integer)}."
elsif operation == 'p'
  puts "The product of the integers between 1 and #{integer} is #{factorial(integer)}."
end
