=begin

The following code:

def my_method(array)
  if array.empty?
    []
  elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

is expected to print:

[]
[21]
[9, 16]
[25, 36, 49]

However, it does not. Obviously, there is a bug. Find and fix the bug, then explain why the buggy program printed the results it did.

=end

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# any object other than an empty array passed initially to my_method will use the truthiness of the array.map method as the condition to do: truthy ? nothing : nothing, hence the nils.