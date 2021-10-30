#Exercises for Section 4 - 'Flow Control'
=begin
1 - Write down whether the following expressions return true or false. Then type the expressions into irb to see the results.

1. (32 * 4) >= 129
2. false != !true
3. true == 4
4. false == (847 == '874')
5. (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false

# false, false, false, true, true
=end

#2 - Write a method that takes a string as argument. The method should return a new, all-caps version of the string, only if the string is longer than 10 characters. Example: change "hello world" to "HELLO WORLD".

def capsed(string)
    return string.upcase if string.length > 10
    string
end

p capsed("Hello World")
p capsed("Helo Wrld")

#3 - Write a program that takes a number from the user between 0 and 100 and reports back whether the number is between 0 and 50, 51 and 100, or above 100.

puts "Please enter a number."
number = gets.chomp.to_i
response = case
when number >= 0 && number <=50
    "Your number is between 0 and 50."
when number >50 && number <= 100
    "Your number is between 50 and 100."
else
    "Your number is greater than 100."
end

p response

=begin
4 - What will each block of code below print to the screen? Write your answer on a piece of paper or in a text editor and then run each block of code to see if you were correct.

1. '4' == 4 ? puts("TRUE") : puts("FALSE")

2. x = 2
   if ((x * 3) / 2) == (4 + 4 - x - 3)
     puts "Did you get it right?"
   else
     puts "Did you?"
   end

3. y = 9
   x = 10
   if (x + 1) <= (y)
     puts "Alright."
   elsif (x + 1) >= (y)
     puts "Alright now!"
   elsif (y + 1) == x
     puts "ALRIGHT NOW!"
   else
     puts "Alrighty!"
   end

# FALSE, "Did you get it right?", "Alright now!"

=end

#5 - Rewrite your program from exercise 3 using a case statement. Wrap this new case statement in a method and make sure it still works.

def num_checker(int)
    response = case
    when int >= 0 && int <=50
        "Your number is between 0 and 50."
    when int >50 && int <= 100
        "Your number is between 50 and 100."
    else
        "Your number is greater than 100."
    end
end

p num_checker(14)

=begin
6 - When you run the following code...

def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
end

equal_to_four(5)
You get the following error message..

exercise.rb:8: syntax error, unexpected end-of-input, expecting keyword_end
Why do you get this error and how can you fix it?

# Both the method and the 'if' conditional require demarcating 'end' clauses.

=end