require 'pry'

class Board
  attr_reader :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts "     |     |"
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}"
    puts "     |     |"
    puts ""
  end

  def reset
    (1..9).each { |key| squares[key] = Square.new }
  end

  def []=(key, marker)
    squares[key].marker = marker
  end

  def unmarked_keys
    squares.keys.select { |key| squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def readable_keys(arr, sym=', ', conj='or')
    last = arr.pop
    conjoinder = sym + conj + ' ' unless arr.empty?
    arr.join(sym) + conjoinder.to_s + last.to_s
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def to_s
    marker
  end
end

class Player
  attr_accessor :score
  attr_reader :marker, :name

  def initialize
    @score = 0
    @name = set_player_name
  end

  def won?(board)
    goal = Array.new(3, marker)
    Board::WINNING_LINES.select do |line|
      return true if board.squares.values_at(*line).map(&:marker) == goal
    end
    false
  end

  def to_s
    @name
  end
end

class Human < Player
  def initialize
    super
    @marker = choose_marker
  end

  def set_player_name
    player_name = nil
    loop do
      puts "Please enter your name!"
      player_name = gets.chomp.capitalize
      break unless player_name == ' '
      puts "Sorry, spaces are not names."
    end

    player_name
  end

  def choose_marker
    puts "Please choose your weapon (X or O)!"
    player_marker = nil
    loop do
      player_marker = gets.chomp.upcase
      break if %w(X O).include?player_marker
      puts "Sorry, please pick (a letter) X or O..."
    end

    player_marker
  end

  def plays_square(board)
    puts "Choose a square (#{board.readable_keys(board.unmarked_keys)}): "
    gets.chomp.to_i
  end
end

class Computer < Player
  attr_accessor :marker

  def initialize
    @marker = nil
    super
  end

  def set_player_name
    %w(Tic Tac Toe).to_a.sample
  end

  def plays_square(board)
    oppo_marker = marker == 'X' ? 'O' : 'X'

    square = if find_at_risk_square(board, marker)
               find_at_risk_square(board, marker)
             elsif find_at_risk_square(board, oppo_marker)
               find_at_risk_square(board, oppo_marker)
             elsif find_best_square(board, avoided: oppo_marker)
               find_best_square(board, avoided: oppo_marker)
             else
               board.unmarked_keys.sample
             end

    square
  end

  def find_at_risk_square(board, symbol)
    empty = Square::INITIAL_MARKER

    Board::WINNING_LINES.each do |line|
      if board.squares.values_at(*line).map(&:marker).count(symbol) == 2 &&
         board.squares.values_at(*line).map(&:marker).count(empty) == 1
        return (board.unmarked_keys & line)[0]
      end
    end
    nil
  end

  def find_best_square(board, avoided)
    live_spaces = Hash.new(0)

    Board::WINNING_LINES.each do |line|
      if board.squares.values_at(*line).map(&:marker).count(avoided) == 0
        (board.unmarked_keys & line).each do |int|
          live_spaces[int] += 1
        end
      end
    end

    live_spaces.max_by { |_, val| val }[0] unless live_spaces.empty?
  end
end

class TTTGame
  attr_accessor :greeting, :whos_turn, :human_score, :comp_score
  attr_reader :board, :human, :computer

  def initialize
    clear_screen
    @greeting = "Welcome to Tic Tac Toe!"
    @board = Board.new
    @human = Human.new
    unchosen_marker = human.marker == 'X' ? 'O' : 'X'
    @computer = Computer.new
    computer.marker = unchosen_marker
    @human_score = 0
    @comp_score = 0
    @whos_turn = [human, computer].sample
  end

  def play
    clear_screen

    loop do
      display_header
      display_board

      loop do
        current_player_moves
        break if whos_turn.won?(board) || board.full?
        pass_the_turn
      end
      display_result
      break unless play_again?
      reset_game
      set_play_again_greeting
    end

    display_goodbye_message
  end

  private

  def clear_screen
    system 'cls'
  end

  def display_header
    puts @greeting
    puts ""
    puts "#{human}'s playing #{human.marker}'s'."
    puts "#{computer}'s on #{computer.marker}'s'"
  end

  def display_board
    noun = human_score > comp_score ? ', You' : ', Computer'
    noun = "" if human_score == comp_score

    puts "Current Score is #{human_score} - #{comp_score}#{noun}."
    puts ""
    board.draw
    puts ""
  end

  def current_player_moves
    square = nil
    loop do
      square = whos_turn.plays_square(board)
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = whos_turn.marker
  end

  def pass_the_turn
    @whos_turn = whos_turn == human ? computer : human
    clear_screen_and_display_board if @whos_turn == human
  end

  def clear_screen_and_display_board
    clear_screen
    display_header
    display_board
  end

  def display_result
    clear_screen_and_display_board

    if human.won?(board)
      puts "You won!"
      @human_score += 1
    elsif computer.won?(board)
      puts "Computer won."
      @comp_score += 1
    else
      puts "The board is full!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset_game
    board.reset
    @whos_turn = [human, computer].sample
    system "cls"
  end

  def set_play_again_greeting
    @greeting = "Let's play again!"
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end
end

game = TTTGame.new
game.play
