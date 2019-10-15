=begin

In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

Examples:

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4

=end

def fibonacci_last(int)
  sequence = []
  first_last = [1, 1] # [fib(1), fib(2)]

  while !sequence.include?(first_last) do
    sequence << first_last
    first_last = [first_last.last, (first_last.first + first_last.last) % 10]
  end

  period_start_index = sequence.find_index(first_last)
  periodicity = sequence.size - sequence.find_index(first_last)

  # two is subtracted from the method arg below to match it to the index in sequence
  sequence[((int - 2 - period_start_index) % periodicity) + period_start_index].last
end

puts fibonacci_last(15) == 0 # (the 15th Fibonacci number is 610)
puts fibonacci_last(20) == 5 # (the 20th Fibonacci number is 6765)
puts fibonacci_last(100) == 5 # (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001) == 1 # (this is a 20899 digit number)
puts fibonacci_last(1_000_007) == 3 # (this is a 208989 digit number)
puts fibonacci_last(123456789) == 4
puts fibonacci_last(123456789987745) == 5
