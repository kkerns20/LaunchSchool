def select(array)
  counter = 0
  output = []

  while counter < array.size do
    output << array[counter] yield array[counter]
  end

  output
end