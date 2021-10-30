=begin

In the code below, an array containing different types of pets is assigned to pets. Also, the return value of pets[2..3], which is ['fish', 'lizard'], is assigned to my_pets.
=end

pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]

=begin
Remove 'lizard' from my_pets then print the value of my_pets.

Expected output:

I have a pet fish!

=end

my_pets.pop
puts my_pets