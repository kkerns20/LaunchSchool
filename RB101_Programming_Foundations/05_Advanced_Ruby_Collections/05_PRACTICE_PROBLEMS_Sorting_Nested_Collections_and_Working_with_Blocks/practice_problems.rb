#1 - How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

sorted_string =  arr.sort do |a, b|
  b.to_i <=> a.to_i
end
puts sorted_string.to_s

#2 - How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_array = books.sort_by { |hsh| hsh[:published].to_i }
puts sorted_array.to_s

#3 - For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr3 = [['abc'], ['def'], {third: ['ghi']}]
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

puts arr1.last.last.last
puts arr2.last[:third].first
puts arr3.last[:third].first[0]
puts hsh1['b'].last
puts hsh2[:third].keys[0]

#4 - For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
hsh1 = {first: [1, 2, [3]]}
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
puts arr1.to_s
arr2[2] = 4
puts arr2.to_s
hsh1[:first][2][0] = 4
puts hsh1.to_s
hsh2[['a']][:a][2] = 4
puts hsh2.to_s

#5 - Given this nested Hash, figure out the total age of just the male members of the family:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0
munsters.each do |_, stats|
  total_age += stats['age'] if stats['gender'] == 'male'
end
puts total_age

#6 - One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and modify it with various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender of each family member:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# ...like this:
# (Name) is a (age)-year-old (male or female).

munsters.each do |name, stats|
  puts "#{name} is a #{stats['age']}-year-old #{stats['gender']}."
end

#7 - Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2 # 2
arr[1][0] -= a # [3, 8]

#8 - Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = []
hsh.each do |_, arr|
  arr.each do |str|
    str.chars { |chr| vowels << chr if 'aeiou'.include?(chr) }
  end
end
puts vowels.to_s

#9 - Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

puts arr.map { |sub_arr| sub_arr.sort.reverse }.to_s

#10 - Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr_2 = arr.map do |hsh|
  new_hsh = {}
  hsh.each do |key, value|
    new_hsh[key] = value + 1
  end
  new_hsh
end
puts arr_2.to_s

#11 - Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

puts arr.map { |sub_arr| sub_arr.select { |int| int % 3 ==0 } }.to_s

#12 - Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
expected_return = {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

hsh = {}
arr.each do |sub_arr|
  hsh[sub_arr[0]] = sub_arr[1]
end
puts hsh == expected_return

#13 - Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
expected_return = [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
# specs unclear here without peeking at solution

new_arr = arr.sort_by do |sub_arr|
  sub_arr.select do |int|
    int.odd?
  end
end

puts new_arr == expected_return

#14 - Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
expected_return = [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

new_arr = []
hsh.each do |_, descriptors|
  case descriptors[:type]
  when 'fruit'
    new_arr << descriptors[:colors].map { |color| color.capitalize }
  when 'vegetable'
    new_arr << descriptors[:size].upcase
  end
end
puts new_arr == expected_return

#15 - Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

puts arr.select { |hsh| hsh.all? { |_, values| values.all? { |int| int.even? } } }.to_s

=begin
16 - A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.
It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.
Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.
It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
Write a method that returns one UUID when called with no parameters.
=end

def uuid
  hex = 'abcdef1234567890'.chars
  [8, 4, 4, 4, 12].map { |length| hex.sample(length).join }.join('-')
end

puts uuid()
