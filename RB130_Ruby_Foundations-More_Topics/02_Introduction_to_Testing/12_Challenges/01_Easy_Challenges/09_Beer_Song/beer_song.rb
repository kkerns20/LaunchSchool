class BeerSong
  def self.verse(i_beers)
    case i_beers
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{i_beers} bottles of beer on the wall, #{i_beers} bottles of beer.\n" \
      "Take one down and pass it around, #{i_beers - 1} bottles of beer on the wall.\n"
    end
  end

  def self.verses(start_int, stop_int)
    start_int.downto(stop_int).to_a.map { |beers| BeerSong.verse(beers) }.join("\n")
  end

  def self.lyrics
    BeerSong.verses(99, 0)
  end
end
