=begin

Given this code:

Copy Code
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end
Fill out the following method calls for gather so that they produce the corresponding output shown in numbers 1-4 listed below:

1)

Copy Code
gather(items) do | , |
  puts
  puts
end
Copy Code
Let's start gathering food.
apples, corn, cabbage
wheat
We've finished gathering!
2)

Copy Code
gather(items) do | , , |
  puts
  puts
  puts
end
Copy Code
Let's start gathering food.
apples
corn, cabbage
wheat
We've finished gathering!
3)

Copy Code
gather(items) do | , |
  puts
  puts
end
Copy Code
Let's start gathering food.
apples
corn, cabbage, wheat
We've finished gathering!
4)

Copy Code
gather(items) do | , , , |
  puts
end
Copy Code
Let's start gathering food.
apples, corn, cabbage, and wheat
We've finished gathering!

=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*first, last|
  puts first.join(', ')
  puts last
end

puts

gather(items) do |first, *middle, last|
  puts first
  puts middle.join(', ')
  puts last
end

puts

gather(items) do |first, *last|
  puts first
  puts last.join(', ')
end

puts

gather(items) do |first, second, third, last|
  puts "#{first}, #{second}, #{third}, and #{last}"
end
