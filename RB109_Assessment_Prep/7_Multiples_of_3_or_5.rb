# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

# Note: If the number is a multiple of both 3 and 5, only count it once.

def factors_sum(int)

  # initialize list
  # start from 1, iterate upto int
    # check if num % 3 == 0 || num % 5 == 0
      # if yes, add to list

  # list.sum

  factors = []

  1.upto(int - 1) do |num|
    factors << num if num % 3 == 0 || num % 5 == 0
  end

  factors.sum
end

puts factors_sum(10) == 23