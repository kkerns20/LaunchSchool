=begin

In the code below, an array containing different types of colors is assigned to colors.
=end

colors = ['red', 'yellow', 'purple', 'green']

=begin
Use Array#each to iterate over colors and print each element.

Expected output:

I'm the color red!
I'm the color yellow!
I'm the color purple!
I'm the color green!

=end

colors.each { |x| puts "I'm the color #{x}!"}