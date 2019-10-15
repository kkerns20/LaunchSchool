=begin

Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

Examples

swap_name('Joe Roberts') == 'Roberts, Joe'

=end

def swap_name(str)
  first = (str.split)[0]
  last = (str.split)[1]
  last + ', ' + first
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'
