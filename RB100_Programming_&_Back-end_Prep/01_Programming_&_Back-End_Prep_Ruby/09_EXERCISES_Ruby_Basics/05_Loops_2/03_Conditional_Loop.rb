=begin

Using an if/else statement, run a loop that prints "The loop was processed!" one time if process_the_loop equals true. Print "The loop wasn't processed!" if process_the_loop equals false.

process_the_loop = [true, false].sample

=end

process_the_loop = [true, false].sample

puts "The smaple value is #{process_the_loop}."

if process_the_loop
    puts "The loop was processed!"
else
    puts "The loop wasn't processed!"
end