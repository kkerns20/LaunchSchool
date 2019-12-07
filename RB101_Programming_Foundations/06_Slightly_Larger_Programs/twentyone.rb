def prompt(msg)
  puts "=> #{msg}"
end

RANKS = [['2', 2], ['3', 3], ['4', 4], ['5', 5], ['6', 6]] +
        [['7', 7], ['8', 8], ['9', 9], ['T', 10], ['J', 10]] +
        [['Q', 10], ['K', 10], ['A', 1]]

SUITS = ['S', 'D', 'C', 'H']

BUST_AFTER = 21
STAND_ON = 17

deck = []
SUITS.each do |suit|
  RANKS.each do |rank|
    deck << [suit, rank]
  end
end

def reshuffle(dck)
  dck.clear
  SUITS.each do |suit|
    RANKS.each do |rank|
      dck << [suit, rank]
    end
  end
  dck
end

def draw_card(dck, hnd)
  hnd << dck.shuffle!.pop
end

def deal_in(dck, hnd)
  hnd.clear
  draw_card(dck, hnd)
end

def displayable_card(crd)
  crd[1][0] + crd[0]
end

def displayable_hand(hnd)
  hnd.map { |card| displayable_card(card) }.join(' ')
end

def calc_hand_total(hnd)
  count = hnd.map { |_, rank| rank[1] }.sum
  hnd.map { |_, rank| rank[0] }.count('A').times do
    count += 10 if count <= 11
  end
  count
end

def game_message(plr_hnd, dlr_hnd, plr_scr, dlr_scr)
  prompt "You are being dealt into a game of Twenty One!"
  prompt "Your current score is #{plr_scr}. Dealer's score is #{dlr_scr}"
  puts ""

  prompt "Dealer is showing #{displayable_hand(dlr_hnd)}."
  prompt "Your hand is #{displayable_hand(plr_hnd)}."

  unless calc_hand_total(plr_hnd) > BUST_AFTER
    prompt "You have #{calc_hand_total(plr_hnd)} points. Hit or Stay?"
  end
end

def play_again?
  prompt "Play again? (y or n)"

  play_again = 'no'
  loop do
    play_again = gets.chomp.downcase[0]
    break if 'yn'.include?(play_again)
    prompt "Invalid choice. Play again? (Y)es or (N)o?"
  end
  play_again == 'y'
end

player_hand = []
dealer_hand = []
player_score = 0
dealer_score = 0

loop do
  deck = reshuffle(deck)
  deal_in(deck, player_hand)
  deal_in(deck, dealer_hand)

  choice = 'hit'
  until choice[0].downcase == 's'
    system 'cls'

    draw_card(deck, player_hand)
    player_points = calc_hand_total(player_hand)

    if player_points > BUST_AFTER
      game_message(player_hand, dealer_hand, player_score, dealer_score)
      prompt "Oh no! Player busts with #{player_points}!"
      dealer_score += 1
      break
    end

    game_message(player_hand, dealer_hand, player_score, dealer_score)

    loop do
      choice = gets.chomp.downcase[0]
      break if 'hs'.include?(choice)
      prompt "Invalid choice. (H)it or (S)tay?"
    end
  end

  unless player_points > BUST_AFTER
    loop do
      draw_card(deck, dealer_hand)
      dealer_points = calc_hand_total(dealer_hand)
      dealer_cards = displayable_hand(dealer_hand)
      break if dealer_points >= STAND_ON
      prompt "Dealer shows #{dealer_cards} (#{dealer_points} pts). They draw..."
      prompt "(Press enter to continue.)"
      gets
    end

    dealer_points = calc_hand_total(dealer_hand)
    dealer_cards = displayable_hand(dealer_hand)
    prompt "Dealer shows #{dealer_cards}."

    if dealer_points > BUST_AFTER
      prompt "Dealer busts! You win!"
      player_score += 1
    elsif dealer_points > player_points
      prompt "Dealer's #{dealer_points} beats your #{player_points}. You lose."
      dealer_score += 1
    elsif dealer_points < player_points
      prompt "Your #{player_points} beats dealer's #{dealer_points}. You win!"
      player_score += 1
    else
      prompt "Player and Dealer each have #{player_points}. It's a push!"
    end
  end

  if player_score == 5
    prompt "You are the grand champion!"
    break
  elsif dealer_score == 5
    prompt "Dealer is the grand champion! Better luck next time!"
    break
  else
    break unless play_again?
  end
end

prompt "Thanks for playing Twenty One!"
