class Octal
  def initialize(string)
    @octal = string
  end

  def to_decimal
    return 0 unless valid_octal?

    @octal.to_i.digits.map.with_index do |digit, idx|
      digit * (8 ** idx)
    end.sum
  end

  private

  def valid_octal?
    @octal.chars.all? { |char| char =~ /[0-7]/ }
  end
end
