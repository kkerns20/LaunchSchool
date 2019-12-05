#Exercises for Section 9 - 'Exercises'

#1 - Use the each method of Array to iterate over

arr_1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# ... and print out each value.

arr_1.each do |thing|
    p thing
end

#2 - Same as above, but only print out values greater than 5.

arr_1.each do |thing|
    p thing if thing >5
end

#3 - Now, using the same array from #2, use the select method to extract all odd numbers into a new array.

arr_3 = arr_1.select { |int| int % 2 == 1 }
puts arr_3.to_s

#4 - Append 11 to the end of the original array. Prepend 0 to the beginning.

arr_1.push(11)
arr_1.unshift(0)
puts arr_1.to_s

#5 - Get rid of 11. And append a 3.

arr_1.pop
arr_1.push(3)
puts arr_1.to_s

#6 - Get rid of duplicates without specifically removing any one value.

arr_1.uniq!
puts arr_1.to_s

#7 - What's the major difference between an Array and a Hash?

# Both are lists, of sorts, but the values in a hash are associated with a tag/label (the key), and are, conceptually, not usually indexed.

#8 - Create a Hash using both Ruby syntax styles.

hash_1 = Hash.new
hash_2 = {}

#9 - Suppose you have a hash...

h = {a:1, b:2, c:3, d:4}

#1. Get the value of key `:b`.
puts h[:b]

#2. Add to this hash the key:value pair `{e:5}`
h[:e] = 5
puts h

#3. Remove all key:value pairs whose value is less than 3.5
puts h.select { |key, val| val < 3.5 }

#10 - Can hash values be arrays? Can you have an array of hashes? (give examples)
hash_of_arrays = {key1: ['a', 'b', 'c'], key2: ['d', 'e', 'f']}
puts hash_of_arrays

new_hash = Hash.new
array_of_hashes = [hash_of_arrays, new_hash]
puts array_of_hashes.to_s

#11 - Look at several Rails/Ruby online documentation sources and say which one you like best and why.

# At short glance, I suspect I'm partial to https://ruby-doc.org/stdlib-2.6.4/

#12 - Given the following data structures. Write a program that moves the information from the array into the empty hash that applies to the correct person.

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contact_data.each do |info|
    if info[0] =~ /joe/
        person = "Joe Smith"
    else
        person = "Sally Johnson"
    end

    info.each do |data|
        if data =~ /@/
            contacts[person][:email] = data
        elsif data =~ /-/
            contacts[person][:phone] = data
        else
            contacts[person][:address] = data
        end
    end
end

puts contacts.to_s

#13 - Using the hash you created from the previous exercise, demonstrate how you would access Joe's email and Sally's phone number?

puts contacts["Joe Smith"][:email]
puts contacts["Sally Johnson"][:phone]

=begin
14 - In exercise 12, we manually set the contacts hash values one by one. Now, programmatically loop or iterate over the contacts hash from exercise 12, and populate the associated data from the contact_data array. Hint: you will probably need to iterate over ([:email, :address, :phone]), and some helpful methods might be the Array shift and first methods.

Note that this exercise is only concerned with dealing with 1 entry in the contacts hash, like this:

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
As a bonus, see if you can figure out how to make it work with multiple entries in the contacts hash.
=end

# Already did this, more or less.

#15 - Use Ruby's Array method delete_if and String method start_with? to delete all of the words that begin with an "s" in the following array.

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |str| str.start_with?('s') }
puts arr.to_s

# Then recreate the arr and get rid of all of the words that start with "s" or starts with "w".
arr.unshift('snow')
arr.insert(3, 'slippery')
arr.insert(4, 'salted roads')
puts arr.to_s

arr.delete_if { |str| str.start_with?('s') || str.start_with?('w')}
puts arr.to_s

#16 - Take the following array:

a = ['white snow', 'winter wonderland', 'melting ice',
    'slippery sidewalk', 'salted roads', 'white trees']

# and turn it into a new array that consists of strings containing one word. (ex. ["white snow", etc...] → ["white", "snow", etc...]. Look into using Array's map and flatten methods, as well as String's split method.

a2 = a.map { |phrase| phrase.split(' ')}
puts a2.flatten.to_s

#17 - What will the following program output?

hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end

# These hashes are the same! Hashes are not indexed, so the order doesn't matter, and the locations of the colons being before of after the symbol doesn't change the fact that they are the same symbol.