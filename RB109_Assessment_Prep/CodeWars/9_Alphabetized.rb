# The alphabetized kata
# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!

# The input is restricted to contain no numerals and only words containing the english alphabet letters.

# Example:

# alphabetized("The Holy Bible") // "BbeehHilloTy"

def alphabetized(str)

  # set new variable = str with whitespace removed
  # convert newvar = array
  # *sort
  # join newvar array
  # return sorted newvar string

  concat_str = str.delete(' ')
  str_arr = concat_str.chars

  sorting_function(str_arr).join

end

def sorting_function(arr)

  # for each pair
    # compare first, second objects
      # if first.downcase > second.downcase
        # swap
        # return result pass swapped array to sorting_function

  (arr.size - 1).times do |index|
    if arr[index].downcase > arr[index + 1].downcase
      arr[index], arr[index + 1] = arr[index + 1], arr[index]
      return sorting_function(arr)
    end
  end

  arr
end

p alphabetized('The Holy Bible') == 'BbeehHilloTy'
