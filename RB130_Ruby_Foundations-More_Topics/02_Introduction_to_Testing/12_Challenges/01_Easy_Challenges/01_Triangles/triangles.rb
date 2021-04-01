class Triangle
  def initialize(side_a, side_b, side_c)
    @sides = [side_a, side_b, side_c]
    raise NoSizeError if @sides.any? { |side| side.zero? }
    raise NegativeSize if @sides.any? { |side| side < 0 }
    raise SizeInequality if @sides.sum < 2 * @sides.max
  end

  def kind
    modal_length = 0
    @sides.each do |side|
      count = @sides.count(side)
      modal_length = count if count > modal_length
    end

    case modal_length
    when 1
      'scalene'
    when 2
      'isosceles'
    when 3
      'equilateral'
    end
  end
end

class ArgumentError < StandardError; end
class NoSizeError < ArgumentError; end
class NegativeSize < ArgumentError; end
class SizeInequality < ArgumentError; end
