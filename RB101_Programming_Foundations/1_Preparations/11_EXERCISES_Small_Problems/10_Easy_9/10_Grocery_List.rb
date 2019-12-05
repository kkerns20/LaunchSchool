=begin

Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

Example:

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

=end

def buy_fruit(arr)
  output = []
  arr.each do |item|
    item[1].times { output << item[0] }
  end
  output
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]
