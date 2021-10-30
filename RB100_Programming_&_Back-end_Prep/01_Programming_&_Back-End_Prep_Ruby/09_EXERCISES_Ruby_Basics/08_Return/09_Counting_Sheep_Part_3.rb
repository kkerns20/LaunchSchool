=begin

What will the following code print? Why? Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep

=end

# It will return lines reading the ints 0 through 2, followed by a line reading nil.