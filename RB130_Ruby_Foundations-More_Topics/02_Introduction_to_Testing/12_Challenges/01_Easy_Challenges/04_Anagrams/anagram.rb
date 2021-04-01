class Anagram
  def initialize(s_word)
    @word = s_word
  end

  def match(a_words)
    a_words.select do |word|
      @word.downcase != word.downcase &&
      word.downcase.chars.sort == @word.downcase.chars.sort
    end
  end
end