#Exercises for Section 3 - 'Methods'

#1 - Write a program that prints a greeting message. This program should contain a method called greeting that takes a name as its parameter and returns a string.

def greeting(name)
    "I am returning a string for #{name}!"
end

puts greeting("Justin")

=begin
2 - What do the following expressions evaluate to?
1. x = 2
    #2
2. puts x = 2
    #nil
3. p name = "Joe"
    Joe
4. four = "four"
    #"four"
5. print something = "nothing"
    #nil
=end

#3 - Write a program that includes a method called multiply that takes two arguments and returns the product of the two numbers.

def multiply(x, y)
    x * y
end

puts multiply(5, 7)

=begin
4 - What will the following code print to the screen?

def scream(words)
    words = words + "!!!!"
    return
    puts words
end

scream("Yippeee")

# This will return nil, since nothing follows the return keyword.

=end

#5 - Edit the method definition in exercise 4 so that it does print words on the screen. What does it return now?

def scream_2(words)
    words = words + "!!!!"
    puts words
    return words
end

scream_2("Yippeee")

#It returns the string valued "Yippeee!!!!"

=begin
6 - What does the following error message tell you?

ArgumentError: wrong number of arguments (1 for 2)
  from (irb):1:in `calculate_product'
  from (irb):4
  from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'

# That the user tried to call a method requiring 2 parameters by only passing 1.

=end