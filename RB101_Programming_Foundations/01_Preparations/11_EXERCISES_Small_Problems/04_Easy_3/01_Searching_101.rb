=begin

Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

Examples:

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].
=end

response = []

5.times do |x|
  grammar = ['1st', '2nd', '3rd', '4th', '5th']

  puts "==> Enter the #{grammar[x]} number:"
  response << gets.chomp
end

puts "==> Enter the last number:"
target = gets.chomp
mod = response.include?(target) ? '' : 'not '
puts "The number #{target} does #{mod}appear in #{response.to_s}."
