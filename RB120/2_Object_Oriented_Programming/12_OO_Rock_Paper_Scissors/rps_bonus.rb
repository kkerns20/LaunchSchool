module QuickSight
  def sees(opponent)
    @seen = opponent.history.last ? opponent.history.last : Move.new('Rock')
  end
end

class Move
  attr_reader :value
  # If extend, make sure to list elements in order of outer dominance ring
  VALUES = ['Rock', 'Lizard', 'Spock', 'Scissors', 'Paper']

  def initialize(value)
    @value = value
  end

  def ties?(other_move)
    @value == other_move.value
  end

  def beats?(opponent)
    index_self = VALUES.index(@value)
    # first_win and second_win break if VALUES array in incorrect order
    first_win = VALUES[(index_self + 1) % 5]
    second_win = VALUES[(index_self + 3) % 5]
    true if [first_win, second_win].include?(opponent.value)
  end

  def verb(opponent)
    verbs = {
      ['Rock', 'Lizard'] => 'crushes',
      ['Rock', 'Scissors'] => 'breaks',
      ['Lizard', 'Spock'] => 'poisons',
      ['Lizard', 'Paper'] => 'eats',
      ['Spock', 'Scissors'] => 'smashes',
      ['Spock', 'Rock'] => 'vaporizes',
      ['Scissors', 'Paper'] => 'cuts',
      ['Scissors', 'Lizard'] => 'decapitates',
      ['Paper', 'Rock'] => 'covers',
      ['Paper', 'Spock'] => 'disproves'
    }

    verbs[[@value, opponent.value]]
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :choice, :name, :score, :history
  POINTS_TO_CHAMPION = 3

  def initialize
    @score = 0
    @history = []
  end

  def chooses
    @history << @choice
  end

  def grand_champion?
    return nil unless score == POINTS_TO_CHAMPION
    puts
    puts "#{name} is the Grand Champion with #{score} points! Good Game!"
    true
  end

  def to_s
    self.class.name
  end

  def sees(nothing) end
end

class Human < Player
  def set_name
    name = nil
    loop do
      puts "What's your name?"
      name = gets.chomp.capitalize
      break unless name.empty? && name != ' '
      puts "Sorry, must enter a value"
    end
    @name = name
  end

  def chooses
    choice = nil
    loop do
      puts
      puts "#{Move::VALUES.join(', ')}... Please choose one!"
      choice = gets.chomp.capitalize
      break if Move::VALUES.include? choice
      puts
      puts "Sorry, invalid choice."
    end
    @choice = Move.new(choice)
    super
  end

  def to_s
    @name
  end
end

class R2D2 < Player
  def chooses
    @choice = Move.new('Rock')
  end
end

class Hal < Player
  def chooses
    array = Move::VALUES + ['Scissors'] * 3
    @choice = Move.new(array.sample)
  end
end

class Chappie < Player
  attr_accessor :seen
  include QuickSight

  def chooses
    @choice = @seen
  end
end

class Sonny < Player
  attr_accessor :seen
  include QuickSight

  def chooses
    cheat = Move::VALUES[(Move::VALUES.index(@seen.to_s) + 2) % 5]
    @choice = Move.new(cheat)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = generate_opponent
  end

  def generate_opponent
    case rand(4)
    when 0 then R2D2.new
    when 1 then Hal.new
    when 2 then Chappie.new
    when 3 then Sonny.new
    end
  end

  def play
    display_welcome_message
    human.set_name

    loop do
      human.chooses
      computer.sees(human)
      computer.chooses
      display_moves
      declare_tie
      declare_winner
      display_scoreboard
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    system 'cls'
    system 'clear'
    puts "Welcome to #{Move::VALUES.join(', ')}!"
  end

  def display_moves
    puts
    puts "#{human} chose #{human.choice}."
    puts "#{computer} chose #{computer.choice}."
  end

  def declare_tie
    player = human.choice
    comp = computer.choice

    puts "#{player} ties #{comp}! No winner..." if player.ties?(comp)
  end

  def declare_winner
    player = human.choice
    comp = computer.choice

    if player.beats?(comp)
      puts "#{player} #{player.verb(comp)} #{comp}! #{human} won!"
      human.score += 1
    elsif comp.beats?(player)
      puts "#{comp} #{comp.verb(player)} #{player}! #{computer} won!"
      computer.score += 1
    end
  end

  def display_scoreboard
    puts "#{human} #{human.score} - #{computer} #{computer.score}"
  end

  def play_again?
    return false if human.grand_champion? || computer.grand_champion?

    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return true if answer == 'y'
  end

  def display_goodbye_message
    puts "Thanks for playing #{Move::VALUES.join(', ')}. Good bye!"
  end
end

RPSGame.new.play
