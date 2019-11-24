# Task
# The year of 2013 is the first year after the old 1987 with only distinct digits.

# Now your task is to solve the following problem: given a year number, find the minimum year number which is strictly larger than the given one and has only distinct digits.

# Input/Output
# [input] integer year

# 1000 ≤ year ≤ 9000

# [output] an integer

# the minimum year number that is strictly larger than the input number year and all its digits are distinct.

def next_distinct_year(int)

  # process
  # iterate upward starting from int
  # at each iteration we want to check uniqness of digits
    # if check == true, exit loop, return current int

  loop do
    int += 1
    if distinct?(int) == true
      return int
    end
  end

end

def distinct?(int)

  # subprocces (check uniqness)
  # int as input
  # convert to string
  # convert to array
  # uniq_ind = false
  # a#each count obj
    # if count > 1, break
    # uniq_ind = true
  # return uniq_ind

  year_array = int.to_s.chars
  uniq_ind = true
  year_array.each do |digit|
    uniq_ind = false if year_array.count(digit) > 1
  end

  uniq_ind
end

puts next_distinct_year(1987)
#puts distinct?(1988)