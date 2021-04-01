class PerfectNumber
  def self.classify(int)
    raise StandardError if int < 2

    comparison = (1..int-1).to_a.select { |number| int % number == 0 }.sum - int
    case
    when comparison.zero?
      "perfect"
    when comparison.positive?
      "abundant"
    when comparison.negative?
      "deficient"
    end
  end
end
