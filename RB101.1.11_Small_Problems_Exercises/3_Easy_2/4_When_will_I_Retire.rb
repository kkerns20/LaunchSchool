=begin

Build a program that displays when the user will retire and how many years she has to work till retirement.

Example:

What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!

=end

require 'date'

puts "What is your age?"
age = gets.to_i
puts "At what age would you like to retire?"
retire_age = gets.to_i

years_remaining = retire_age - age
retirement_year = Date.today.year + years_remaining
puts "It's #{Date.today.year}. You will retire in #{retirement_year}."
puts "You have only #{years_remaining} years of work to go!"
