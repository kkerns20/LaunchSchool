def reduce(array, initial_value=0)
  counter = 0
  accumulator = initial_value

  while counter < array.size do
    accumulator = yield accumulator, array[counter]
    counter += 1
  end

  accumulator
end