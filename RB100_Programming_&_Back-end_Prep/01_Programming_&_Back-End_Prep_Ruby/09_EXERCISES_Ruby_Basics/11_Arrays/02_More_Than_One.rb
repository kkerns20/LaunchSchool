=begin

In the code below, an array containing different types of pets is assigned to pets.
=end

pets = ['cat', 'dog', 'fish', 'lizard']

=begin
Select 'fish' and 'lizard' from pets at the same time, assign the return value to a variable named my_pets, then print the value of my_pets.

Expected output:

I have a pet fish and a pet lizard!

=end

my_pets = pets[2..3]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"
