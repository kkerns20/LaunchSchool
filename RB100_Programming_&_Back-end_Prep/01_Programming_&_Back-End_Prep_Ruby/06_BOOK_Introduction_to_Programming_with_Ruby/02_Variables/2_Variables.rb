#Exercises for Section 2 - 'Variables'

#1 - Write a program called name.rb that asks the user to type in their name and then prints out a greeting message with their name included.

puts "Hi User, what is your first name?"
first_name = gets.chomp
puts "Welcome to the answer to question 1, #{first_name}!"

#2 - Write a program called age.rb that asks a user how old they are and then tells them how old they will be in 10, 20, 30 and 40 years. Below is the output for someone 20 years old.

puts "Hi User, how old are you? (Input an integer, please)"
age = gets.chomp.to_i
puts "After 10, 20, 30, and 40 years, you will be #{(age + 10).to_s}, #{(age + 20).to_s}, #{(age + 30).to_s}, and #{(age + 40).to_s} years old!"

#3 - Add another section onto name.rb that prints the name of the user 10 times. You must do this without explicitly writing the puts method 10 times in a row.
#       Hint: you can use the times method to do something repeatedly.

#...
10.times {
    puts first_name
}

#4 - Modify name.rb again so that it first asks the user for their first name, saves it into a variable, and then does the same for the last name. Then outputs their full name all at once.

#...
puts "...and what is your last name"
last_name = gets.chomp
puts "Sounds like your name must be #{first_name} #{last_name}!"

=begin
5 - Look at the following programs...

x = 0
3.times do
  x += 1
end
puts x
and...

y = 0
3.times do
  y += 1
  x = y
end
puts x
What does x print to the screen in each case? Do they both give errors? Are the errors different? Why?
=end
# x prints 3 first, then a variable undefined error. The error thrown is due to x being local in scope to the 'times' method.