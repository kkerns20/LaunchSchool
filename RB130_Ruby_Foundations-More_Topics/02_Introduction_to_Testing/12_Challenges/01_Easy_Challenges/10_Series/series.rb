class Series
  def initialize(s_numberlike)
    @numberlike = s_numberlike
  end

  def slices(i_length)
    raise ArgumentError if i_length > @numberlike.size

    (0..@numberlike.size-i_length).to_a.map do |starting_index|
      @numberlike.chars[starting_index..starting_index+i_length-1].map(&:to_i)
    end
  end
end