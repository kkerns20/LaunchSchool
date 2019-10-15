=begin

Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

Examples

What is your name? Bob
Hello Bob.
What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?

=end

puts "What is your name?"
name = 'Justin'#gets.chomp

if name.end_with?('!')
  puts "HELLO #{name.delete_suffix('!').upcase}. WHY ARE WE SCREAMING?"
else 
  puts "Hello #{name}."
end
