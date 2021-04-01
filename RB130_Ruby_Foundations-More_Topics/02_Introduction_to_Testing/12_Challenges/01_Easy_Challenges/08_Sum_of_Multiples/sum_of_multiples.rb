class SumOfMultiples

  def self.to(int)
    SumOfMultiples.new(3, 5).to(int)
  end

  def initialize(*args)
    @even_divisors = args
  end

  def to(int)
    (1..int-1).to_a.select do |number|
      @even_divisors.any? { |divisor| number % divisor == 0 }
    end.sum
  end
end
