# Task
# Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

# Example
# For n = 152, the output should be 52;

# For n = 1001, the output should be 101.

# Input/Output
# [input] integer n

# Constraints: 10 ≤ n ≤ 1000000.

# [output] an integer

def function(int)
  
  # initialize leaderboard = 0
  # string_number => int.to_s

  # count number of chars in string_number
  # count times delete differ char
    # convert smaller string to int
    # compare this num to leaderboard
      # if bigger, set leaderboard to this num

  # return leaderboard

  leaderboard = 0
  string_number = int.to_s

  string_number.size.times do |index|
    string_number = int.to_s
    string_number[index] = ''
    new_number = string_number.to_i
    leaderboard = new_number if new_number > leaderboard
  end

  leaderboard
end

puts function(152) == 52
puts function(1001) == 101
