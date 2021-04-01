class DNA
  def initialize(s_sequence)
    @sequence = s_sequence
  end

  def hamming_distance(s_other_sequence)
    length = [@sequence.size, s_other_sequence.size].min
    comparer = @sequence.chars.take(length).zip(s_other_sequence.chars.take(length))

    comparer.count { |point| point.first != point.last }
  end
end
