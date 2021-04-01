class Scrabble
  TILE_POINTS = {
    1 => "AEIOULNRST",
    2 => "DG",
    3 => "BCMP",
    4 => "FHVWY",
    5 => "K",
    8 => "JX",
    10 => "QZ"
  }

  def self.score(s_word)
    return 0 unless s_word

    short_word = s_word.gsub(/[^A-Z]/i, "")
    return 0 if short_word.empty?

    short_word.chars.map do |letter|
      x = TILE_POINTS.select { |points, letters| letters.include?(letter.upcase) }
      x.first.first
    end.sum
  end

  def initialize(s_word)
    @word = s_word
  end

  def score(s_word=@word)
    Scrabble.score(s_word)
  end
end
