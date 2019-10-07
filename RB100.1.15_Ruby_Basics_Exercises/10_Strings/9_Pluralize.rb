=begin

Given the following code, use Array#each to print the plural of each word in words.

words = 'car human elephant airplane'

Expected output:

cars
humans
elephants
airplanes

=end

words = 'car human elephant airplane'
words_array = words.split(' ')
words_array.each { |x| puts x + 's' }