=begin

Write a program that requests two integers from the user, adds them together, and then displays the result. Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.

Do not check for the positive/negative requirement until both integers are entered, and start over if the requirement is not met.

You may use the following method to validate input integers:
=end

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

=begin
Examples:

$ ruby opposites.rb
>> Please enter a positive or negative integer:
8
>> Please enter a positive or negative integer:
0
>> Invalid input. Only non-zero integers are allowed.
>> Please enter a positive or negative integer:
-5
8 + -5 = 3

$ ruby opposites.rb
>> Please enter a positive or negative integer:
8
>> Please enter a positive or negative integer:
5
>> Sorry. One integer must be positive, one must be negative.
>> Please start over.
>> Please enter a positive or negative integer:
-7
>> Please enter a positive or negative integer:
5
-7 + 5 = -2

=end

positive_int = 0
negative_int = 0
while positive_int == 0 || negative_int == 0
    puts ">> Please enter a positive or negative integer:"
    reply = gets.to_i

    if !valid_number?(reply)
        puts ">> Invalid input. Only non-zero integers are allowed." unless valid_number?(reply)
    else
        if reply > 0 && positive_int = 0
            positive_int = reply
        elsif reply < 0 && negative_int = 0
            negative_int = reply
        else
            puts ">> Sorry. One integer must be positive, one must be negative."
        end
    end
end

result = positive_int + negative_int
puts "#{negative_int} + #{positive_int} = #{result}"