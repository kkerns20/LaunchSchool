# Welcome.

# In this kata you are required to, given a string, replace every letter with its position in the alphabet.

# If anything in the text isn't a letter, ignore it and don't return it.

# "a" = 1, "b" = 2, etc.

# Example
# alphabet_position("The sunset sets at twelve o' clock.")
# Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)

def alphabet_position(str)

  # initialize out_array = []

  # set working variable to str splits on chars
  # iterate over chars
    # if 97 <= lower(char).ord <= 122
      # convert (that value - 96) to string and add to out_array
  # join out_array with spaces and return

  out_array = []

  str_arr = str.chars
  str_arr.each do |char|
    char_value = char.downcase.ord - 96
    out_array << char_value.to_s if char_value >= 1 && char_value <= 26
  end

  out_array.join(' ')

end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
