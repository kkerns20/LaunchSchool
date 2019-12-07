#1 - What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# [1, 2, 3] because 'hi' (the ultimate expression in the block) is truthy, so each iterated value is included in the return array.

#2 - How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# We can find out how built-in functions work by consulting Ruby Docs.

#3 - What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# [1, 2, 3]. Reject functions as the inverse of select.

#4 - What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# { 'a'=>'ant', 'b'=>'bear, 'c'=>'cat }. Value[0] returns the substring sliced from value, feeding it to hash in [] makes it a key, and the value for that key is set to the string.

#5 - What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# Shift 'pops' the 0th indexed item and returns it, [a: , 'ant'] here. We can find out by consulting Ruby Docs.

#6 - What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# 11. Pop returns 'caterpillar', which size then refers to.

#7 - What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# true, then false, then true. Asks if 1 is odd, then 2, then 3. The return value is true. Any? functions as a logical OR on the trutiness of the last expression (1 and 3 both satisfy). 

#8 - How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# Take(n) returns the first n objects from an array, returning them as a new array. We can find out by consulting Ruby Docs. It is not destructive.

#9 - What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# [ nil, 'bear']. Map always returns an array. The array is 1:1 in size with the passed object. The first element is nil because the first value (ant) is too short. The second is 'bear' because bear is longer than 3 chars.

#10 - What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# [ 1, nil, nil ] The nils are there because puts always returns nil.