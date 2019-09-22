=begin

In the code below, stoplight is randomly assigned as 'green', 'yellow', or 'red'.
=end

stoplight = ['green', 'yellow', 'red'].sample

=begin
Write a case statement that prints "Go!" if stoplight equals 'green', "Slow down!" if stoplight equals 'yellow', and "Stop!" if stoplight equals 'red'.

=end

case stoplight
    when 'green'
        puts "Go!"
    when 'yellow'
        puts "Slow down!"
    else
        puts "Stop!"
    end