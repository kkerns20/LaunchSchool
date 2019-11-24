# Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of that string: The numeric values represent the occurrence of each letter
# preceding that numeric value. There should be no numeric characters in the final string. Empty strings should return an empty string.

# The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears.

# string_expansion('3D2a5d2f') == 'DDDaadddddff'
# string_expansion('3abc') == 'aaabbbccc'       # correct
# string_expansion('3abc') != 'aaabc'           # wrong
# string_expansion('3abc') != 'abcabcabc'       # wrong
# If there are two consecutive numeric characters the first one is ignored.

# string_expansion('3d332f2a') == 'dddffaa'
# If there are two consecutive alphabetic characters then the first character has no effect on the one after it.

# string_expansion('abcde') == 'abcde'
# Your code should be able to work for both lower and capital case letters.

# string_expansion('') == ''

def string_expansion(str)

  # out_string = ''
  # multiplier = 1

  # convert str to array of chars
  # iterate through the chars...
    # if char -> int-like
      # set multiplier value to char.to_i
    # expanded by current multiplier and added to out_string

  # return out_string
  
  out_string = ''
  multiplier = 1

  string_array = str.chars
  string_array.each do |char|
    if char.to_i.to_s == char
      multiplier = char.to_i
    else
      out_string << char * multiplier
    end
  end

  out_string
end

p string_expansion('3D2a5d2f') == 'DDDaadddddff'
p string_expansion('3abc') == 'aaabbbccc'
p string_expansion('3d332f2a') == 'dddffaa'
p string_expansion('abcde') == 'abcde'
p string_expansion('') == ''
