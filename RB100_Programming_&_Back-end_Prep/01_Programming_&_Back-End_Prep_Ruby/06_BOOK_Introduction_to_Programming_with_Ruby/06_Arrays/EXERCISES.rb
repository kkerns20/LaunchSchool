#Exercises for Section 6 - 'Arrays'

=begin
1 - Below we have given you an array and a number. Write a program that checks to see if the number appears in the array.

arr = [1, 3, 5, 7, 9, 11]
number = 3

puts "This array contains the number 3." if arr.include?(3) == true
=end

=begin
2 - What will the following programs return? What is value of arr after each?

1. arr = ["b", "a"]
   arr = arr.product(Array(1..3))
   arr.first.delete(arr.first.last)

2. arr = ["b", "a"]
   arr = arr.product([Array(1..3)])
   arr.first.delete(arr.first.last)

# returns '1', arr = [["b"], ["b", "2"], ["b", "3"], ["a", "1"], ["a", "2"], ["a", "3"]]
# returns [1, 2, 3], arr = [["b"], ["a", [1, 2, 3]]]
=end

=begin
3 - How do you return the word "example" from the following array?

arr = [["test", "hello", "world"],["example", "mem"]]
# arr.last.first
=end

=begin
4 - What does each method return in the following example?

arr = [15, 7, 18, 5, 12, 8, 5, 1]

1. arr.index(5)
# 3
2. arr.index[5]
# This is not a thing
3. arr[5]
# 8
=end

=begin
5 - What is the value of a, b, and c in the following program?

string = "Welcome to America!"
a = string[6] # 'e'
b = string[11] # 'A'
c = string[19] # nil
=end

=begin
6 - You run the following code...

names = ['bob', 'joe', 'susan', 'margaret']
names['margaret'] = 'jody'
...and get the following error message:

TypeError: no implicit conversion of String into Integer
  from (irb):2:in `[]='
  from (irb):2
  from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'
What is the problem and how can it be fixed?

# I appears you are trying to change the value of the index currently holding 'margaret'.
# To do so, names[3] = 'jody'
=end

=begin
7 - Write a program that iterates over an array and builds a new array that is the result of incrementing each value in the original array by a value of 2. You should have two arrays at the end of this program, The original array and the new array you've created. Print both arrays to the screen using the p method instead of puts.

arr = [5, -4, 1249, 0.5]
arr2 = []

arr.each do |val|
    arr2.push(val + 2)
end

p arr
p arr2
=end