require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, sym=', ', conj='or')
  last = arr.pop
  conjoinder = sym + conj + ' ' if arr.size > 0
  arr.join(sym) + conjoinder.to_s + last.to_s
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, player_score, computer_score)
  system 'cls'
  puts "You're playing #{PLAYER_MARKER}'s'. Computer is #{COMPUTER_MARKER}'s'."
  puts "Player score = #{player_score}. Computer score = #{computer_score}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = case
  when find_at_risk_square(brd, COMPUTER_MARKER)
    find_at_risk_square(brd, COMPUTER_MARKER)
  when find_at_risk_square(brd, PLAYER_MARKER)
    find_at_risk_square(brd, PLAYER_MARKER)
  else
    empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  if current_player == 'Player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  return 'Computer' if current_player == 'Player'
  'Player'
end

def find_at_risk_square(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      return (empty_squares(brd) & line)[0]
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def champion?(player_score, computer_score)
  case
  when player_score == 5
    puts 'Player is the champion with 5 points! Good Game!'
    true
  when computer_score == 5
    puts 'Computer is the champion with 5 points! Good Game!'
    true
  end
end

player_score = 0
computer_score = 0

loop do
  board = initialize_board

  current_player = 'Player'
  loop do
    display_board(board, player_score, computer_score)

    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board, player_score, computer_score)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    player_score += 1 if detect_winner(board) == 'Player'
    computer_score += 1 if detect_winner(board) == 'Computer'
  else
    prompt "It's a tie!"
  end

  break if champion?(player_score, computer_score)

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
