=begin

Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name
What does this code print out? Think about it for a moment before continuing.

If you said that code printed

Alice
Bob
you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
What does this print out? Can you explain these results?

=end

# It prints, BOB twice, seperated by new lines. This is because the ! at the end of the upcase method overwrites the referenced value with the new result, so all things pointing to the old value get updated, not re-referenced.