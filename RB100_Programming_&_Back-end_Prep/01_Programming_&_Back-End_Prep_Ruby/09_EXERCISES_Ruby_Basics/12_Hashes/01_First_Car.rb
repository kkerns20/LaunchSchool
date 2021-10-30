=begin

Create a hash that contains the following data and assign it to a variable named car.

type	color	mileage
sedan	blue	80_000

=end

car = Hash.new
car['type'] = 'sedan'
car['color'] = 'blue'
car['mileage'] = '80_000'

puts car