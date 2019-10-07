=begin

Use Hash#select to iterate over numbers and return a hash containing only key-value pairs where the value is less than 25. Assign the returned hash to a variable named low_numbers and print its value using #p.
=end

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

=begin
Expected output:

{:low:=>10}

=end

low_numbers = numbers.select { |key, value| value < 25 }
puts low_numbers