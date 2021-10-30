=begin

Add the appropriate accessor methods to the following code.

class Person
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name
Expected output:

Jessica

=end

class Person
  attr_reader :name
  attr_writer :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name
