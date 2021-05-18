class Diamond
  def self.make_diamond(s_equator_letter)
    range = ("A"..s_equator_letter).to_a
    equator_width = range.size * 2 - 1
    complete_range = range + range.reverse[1..-1]
    complete_range.map! do |letter|
      if letter == "A"
        letter.center(equator_width)
      else
        [letter, letter].join(" " * (range.index(letter) * 2 - 1)).center(equator_width)
      end
    end
    complete_range.join("\n") + "\n"
  end
end
