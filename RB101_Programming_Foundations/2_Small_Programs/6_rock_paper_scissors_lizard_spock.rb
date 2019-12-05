DISPLAY_CHOICES = %w((r)ock (p)aper (sc)issors (sp)ock (l)izard)
ENTRY_CHOICES = %w(r p sc sp l)
GAME_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  puts "=> #{message}"
end

beats = { 'rock' => %w(lizard scissors),
          'paper' => %w(rock spock),
          'scissors' => %w(paper lizard),
          'spock' => %w(scissors rock),
          'lizard' => %w(spock paper) }

player_wins = 0
computer_wins = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: #{DISPLAY_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().downcase()

    if ENTRY_CHOICES.include?(choice)
      choice = GAME_CHOICES[ENTRY_CHOICES.index(choice)]
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = GAME_CHOICES.sample

  prompt("you chose: #{choice}; Computer chose: #{computer_choice}.")

  if choice == computer_choice
    prompt("It's a tie!")
  elsif beats[choice].include?(computer_choice)
    player_wins += 1
    prompt("You won! Current score #{player_wins}-#{computer_wins}")
  else
    computer_wins += 1
    prompt("Computer won! Current score #{player_wins}-#{computer_wins}")
  end

  if player_wins == 5
    prompt("You have won 5 times! You are the Grand Winner!")
    break
  elsif computer_wins == 5
    prompt("The computer has won 5 times. Better luck next time!")
    break
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
