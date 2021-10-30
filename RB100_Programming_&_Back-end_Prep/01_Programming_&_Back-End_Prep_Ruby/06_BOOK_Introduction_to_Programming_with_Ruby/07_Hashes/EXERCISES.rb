#Exercises for Section 7 - 'Hashes'


#1 - Given a hash of family members, with keys as the title and an array of names as the values, use Ruby's built-in select method to gather only immediate family members' names into a new array.

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immediate_family = family.select do |k,v|
    k == :sisters || k == :brothers
end

p immediate_family.values.flatten

#2 - Look at Ruby's merge method. Notice that it has two versions. What is the difference between merge and merge!? Write a program that uses both and illustrate the differences.

# Merge! 'mutes the calling object.

#3 - Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys. Then write a program that does the same thing except printing the values. Finally, write a program that prints both.

family.keys.each do |x|
    puts x
end

family.values.each do |x|
    puts x
end

family.each do |x, y|
    puts "Key is #{x}, Value is #{y}"
end

#4 - Given the following expression, how would you access the name of the person?

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

puts person[:name]

#5 - What method could you use to find out if a Hash contains a specific value in it? Write a program to demonstrate this use.

puts family[:uncles].include?('joe')
puts family.has_value?(["bob", "joe", "steve"])

#6 - Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
    'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
    'flow', 'neon']

# Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

words_hsh = Hash.new
words.each do |x|
    temp_hsh = Hash.new
    x.split('').each do |letter|
        if temp_hsh.has_key?(letter)
            temp_hsh[letter] += 1
        else
            temp_hsh[letter] = 1
        end 
    end

    if words_hsh.has_key?(temp_hsh)
        words_hsh[temp_hsh].push x
    else
        words_hsh[temp_hsh] = [x]
    end

end

words_hsh.each do |key, value|
    puts "#{value}"
end

#7 - Given the following code...

x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

# What's the difference between the two hashes that were created?
# my_hash has a symbol for a key named, literally, x. my_hash2 has the string "hi there" for a key.

=begin
8 - If you see this error, what do you suspect is the most likely problem?

NoMethodError: undefined method `keys' for Array
A. We're missing keys in an array variable.

B. There is no method called keys for Array objects.

C. keys is an Array object, but it hasn't been defined yet.

D. There's an array of strings, and we're trying to get the string keys out of the array, but it doesn't exist.

#B
=end