#Exercises for Section 5 - 'Loops and Iterators'

=begin
1 - What does the each method in the following program return after it is finished executing?

x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end

# It returns the original array, [1, 2, 3, 4, 5].
=end

#2 - Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". Each loop can get info from the user.

loop do
    puts = "Please type 'STOP' (without quotes)."
    input = gets.chomp
    if input != 'STOP'
        puts = "You typed #{input}, I can't stop til you type 'STOP' (without quotes)."
        next
    end
    break
end

#3 - Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.

arr = ['White', 'Blue', 'Black', 'Red', 'Green']
arr.each_with_index do |color, index|
    puts "#{index + 1}. #{color}"
end

#4 - Write a method that counts down to zero using recursion.

def final_countdown(number)
    if number <= 0
        puts "Happy New Year!!!"
    else
        puts "#{number}"
        final_countdown(number - 1)
    end
end

final_countdown(10)