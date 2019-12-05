# Task
#  	In this simple Kata your task is to create a function that turns a string into a Mexican Wave.
#   You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
# Rules
#  	1.  The input string will always be lower case but maybe empty.
#   2.  If the character in the string is whitespace then pass over it as if it was an empty seat.
# Example
# wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

# input: string of words
# output: array of strings of word

def wave(sentence)

  # initialize out_array = []
  # split the sentence on chars, assign to var

  # count elements in var
  # count.times upcase ith element of the variable
  # if up'd var != var
    # join the elements
    # pass new string to array
  
  # return out_array

  out_array = []
  sentence.size.times do |ind|
    sentence_array = sentence.chars
    sentence_array[ind].upcase!
    new_sentence = sentence_array.join
    out_array << new_sentence if new_sentence != sentence
  end

  return out_array
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
