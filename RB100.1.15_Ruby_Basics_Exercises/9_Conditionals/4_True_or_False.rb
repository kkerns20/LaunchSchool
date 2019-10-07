=begin

In the code below, boolean is randomly assigned as true or false.
=end

boolean = [true, false].sample

=begin
Write a ternary operator that prints "I'm true!" if boolean equals true and prints "I'm false!" if boolean equals false.

=end

boolean ? puts("I'm true!") : puts("I'm false!")