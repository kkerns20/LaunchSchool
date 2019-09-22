=begin

Using a while loop, print 5 random numbers between 0 and 99. The code below shows an example of how to begin solving this exercise.

numbers = []

while <condition>
  # ...
end
Example output (your numbers will most likely be different):

62
96
31
16
36

=end

numbers = []

while numbers.size < 5
    curr_num = rand(100)
    puts curr_num
    numbers.push(curr_num)
end

puts numbers.to_s