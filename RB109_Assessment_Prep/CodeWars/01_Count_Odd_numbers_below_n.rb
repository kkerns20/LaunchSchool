# Given a number n, return the number of positive odd numbers below n, EASY!

# oddCount(7) //=> 3, i.e [1, 3, 5]
# oddCount(15) //=> 7, i.e [1, 3, 5, 7, 9, 11, 13]
# Expect large Inputs!

def oddCount(int)

  # initialize counter
  # begin at int
  # iterate downward through the integers
    # check to see if the current int is odd
    # if so we will increment our counter
  # halt at 0
  # return count as int

  counter = 0
  (int-1).downto(0) do |x|
    counter += 1 if x.odd?
  end

  return counter

end

puts oddCount(7) == 3
puts oddCount(15) == 7
puts oddCount(123456789)