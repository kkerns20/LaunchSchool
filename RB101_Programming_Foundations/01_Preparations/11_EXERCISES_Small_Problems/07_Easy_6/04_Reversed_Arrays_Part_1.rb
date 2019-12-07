=begin

Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Examples:

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
list == ["abc"]

list = []
reverse!(list) == []
list == []

=end

def reverse!(array)
  break_point = array.length / 2.0

  i = 0
  while i < break_point.floor do
    array[i], array[-i - 1] = array[-i - 1], array[i]
    i += 1
  end
  array
end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
puts reverse!(list) == ["abc"]
list == ["abc"]

list = []
puts reverse!(list) == []
list == []
