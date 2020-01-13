=begin

Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

game = GuessingGame.new
game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
Note that a game object should start a new game with a new number to guess with each call to #play.

=end

require 'pry'

class GuessingGame
  attr_accessor :guess, :attempts
  WIN_MSG = "You won!"
  LOSE_MSG = "You have no more guesses. You lost!"
  PROMPT = "Enter a number between 1 and 100:"

  def initialize
    @guess = nil
    @target = (1..100).to_a.sample
    @attempts = 7
  end

  def play
    loop do
      prompt_player
      validate_guess
      evaluate_guess
      break if @attempts == 0 || @guess == @target
    end

    puts
    puts @guess == @target ? WIN_MSG : LOSE_MSG
  end

  def prompt_player
    puts
    puts "You have #{attempts.to_s} guesses remaining."
    puts PROMPT
  end

  def validate_guess
    input = nil
    loop do
      input = gets.chomp.to_i
      break if (1..100).to_a.include?(input)
      puts "Invalid guess. #{PROMPT}"
    end

    @attempts -= 1
    @guess = input
  end

  def evaluate_guess
    case
    when @guess < @target
      puts "Your guess is too low."
    when @guess > @target
      puts "Your guess is too high."
    when @guess = @target
      puts "That's the number!"
    end
  end
end

game = GuessingGame.new
game.play
