class RomanNumeral
  MAP = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  def initialize(int)
    @number = int
  end

  def to_roman
    roman = ""
    remainder = @number
    until remainder == 0 do
      value, numeral = MAP.select { |value, _| value <= remainder }.max
      roman += numeral
      remainder -= value
    end

    roman
  end
end
