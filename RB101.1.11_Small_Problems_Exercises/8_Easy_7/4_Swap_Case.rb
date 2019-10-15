=begin

Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

Example:

swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

=end

CAPITALS = ('A'..'Z').to_a
LOWERS = ('a'..'z').to_a

def swapcase(str)
  output = ''
  str.chars.each do |chr|
    if CAPITALS.include?(chr)
      output << chr.downcase!
    elsif LOWERS.include?(chr)
      output << chr.upcase!
    else
      output << chr
    end
  end
  output
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
