=begin

Assume you have the following code:
require 'date'

puts Date.new
puts Date.new(2016)
puts Date.new(2016, 5)
puts Date.new(2016, 5, 13)
What will each of the 4 puts statements print?

=end

# Ruby reference time (the default)
# The first date in 2016 (Jan 1)
# The first date in May 2016 (May 1)
# Exactly May 13, 2016
