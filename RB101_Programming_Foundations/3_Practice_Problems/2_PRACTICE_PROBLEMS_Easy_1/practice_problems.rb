#Exercises for Section 1 - 'Practice Problems: Easy 1'

#1 - What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers.to_s

# [1, 2, 2, 3]

=begin
2 - Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

what is != and where should you use it? # Equivalent to 'is not equal to'
put ! before something, like !user_name # Boolean operator for negation
put ! after something, like words.uniq! # Conventional signal that the method mutates the caller.
put ? before something, # Ternery operator
put ? after something, # Usually method that returns a boolean.
put !! before something, like !!user_name # Returns truthiness of user_name
=end

# ! can be appended to the alias of a method that mutates the object(s) passed to it. It is also the logical not operator in boolean algebra.
# ? can also be used as an appendix to a method alias to signify the return value is a boolean. It is also used syntactically in the as part of the ? : contruction of a conditional operator.

#3 - Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.gsub!('important', 'urgent')

#4 - The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?
numbers.delete_at(1).to_s # => [1, 3, 4, 5]
numbers.delete(1).to_s # => [2, 3, 4, 5]

#5 - Programmatically determine if 42 lies between 10 and 100.

puts 42 > 10 && 42 < 100
puts 100 - 42 > 10
def programmatic(x)
  x = 10
  until x == 100 do
    x += 1
    return true if x == 42
  end
  false
end
puts programmatic(42)

#6 - Starting with the string below, show two different ways to put the expected "Four score and " in front of it:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

puts "Four score and " + famous_words
puts "Four score and " << famous_words

#7 - Fun with gsub:

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

# This gives us a string that looks like a "recursive" method call:
"add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

# If we take advantage of Ruby's Kernel#eval method to have it execute this string as if it were a "recursive" method call
eval(how_deep)

# what will be the result?

puts eval(how_deep)

#8 - If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# Make this into an un-nested array.

puts flintstones.flatten.to_s

#9 - Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number

puts flintstones.assoc("Barney").to_s