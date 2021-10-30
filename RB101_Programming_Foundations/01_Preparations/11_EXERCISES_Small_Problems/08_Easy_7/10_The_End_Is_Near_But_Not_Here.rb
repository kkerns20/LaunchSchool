=begin

Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

Examples:

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

=end

def penultimate(str)
  (str.split)[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'
