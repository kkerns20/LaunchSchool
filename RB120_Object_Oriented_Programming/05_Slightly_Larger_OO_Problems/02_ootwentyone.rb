require 'pry'

class Hand
  attr_accessor :cards, :stays

  def initialize
    @cards = []
    @stays = false
  end

  def hit_or_stay
    puts
    puts "Enter action: (H)it or (S)tay.\n"
    action = nil
    loop do
      action = gets.chomp.downcase[0]
      break if %w(h s).include?(action)
      puts "Sorry, invalid action. Try again."
    end

    action
  end

  def take_a_card(card)
    @cards << card
  end

  def total
    sum = @cards.map(&:value).sum
    aces = @cards.select { |c| c.value == 11 }.size

    aces.times do
      sum -= 10 if sum > 21
    end

    sum
  end

  def busted?
    total > 21
  end

  def stayed?
    @stays = true
  end

  def to_s
    cards.map(&:to_s).join(' ')
  end
end

class Deck
  SUITS = ['D', 'C', 'H', 'S']
  RANKS_POINTS = [['2', 2], ['3', 3], ['4', 4], ['5', 5]] +
                 [['6', 6], ['7', 8], ['8', 8], ['9', 9]] +
                 [['T', 10], ['J', 10], ['Q', 10], ['K', 10]] +
                 [['A', 11]]

  def initialize
    @deck = shuffle_52
    # obviously, we need some data structure to keep track of cards
    # array, hash, something else?
  end

  def deal_card_to(hand)
    hand.take_a_card(@deck.pop)
  end

  private

  def shuffle_52
    deck = []
    SUITS.each do |suit|
      RANKS_POINTS.each do |rank|
        deck << Card.new(suit, rank[0], rank[1])
      end
    end

    deck.shuffle
  end
end

class Card
  attr_reader :suit, :rank, :value

  def initialize(suit, rank, value)
    @suit = suit
    @rank = rank
    @value = value
  end

  def to_s
    rank + suit
  end
end

class Game
  attr_reader :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Hand.new
    @dealer = Hand.new
  end

  def start
    deal_cards

    player_turn
    case player.busted?
    when true
      display_bust_message
    when false
      dealer_turn
      show_result
    end
  end

  def clear_screen
    system 'cls'
  end

  def welcome_player
    puts "Welcome to Twenty One!"
    puts "Cards are being dealt..."
    puts
  end

  def deal_cards
    deck.deal_card_to(player)
    deck.deal_card_to(dealer)
    deck.deal_card_to(player)
    deck.deal_card_to(dealer)
  end

  def display_game_state
    dealer_upcard = dealer.cards[0]
    stay_placeholder = player.stays ? ' stays.' : '...'

    puts "Dealer shows #{dealer_upcard}. (Total of #{dealer_upcard.value}.)"
    puts
    puts "Player shows #{player}"
    puts "Player total is #{player.total}. Player#{stay_placeholder}"
  end

  def player_turn
    loop do
      clear_screen
      welcome_player
      display_game_state

      case player.hit_or_stay
      when 'h'
        deck.deal_card_to(player)
        break if player.busted?
      when 's'
        player.stays
        break
      end
    end

    puts "Thank you for playing Twenty-One. Goodbye!"
  end

  def display_bust_message
    clear_screen
    welcome_player
    display_game_state

    puts
    puts "Oh noes! Player busts with #{player.total}!"
    puts "Better luck next time!"
    puts
  end

  def dealer_status
    puts
    puts "Dealer reveals cards: #{dealer}"
    puts "Dealer total is #{dealer.total}"
    puts
  end

  def dealer_turn
    loop do
      clear_screen
      welcome_player
      display_game_state
      dealer_status

      if dealer.total < 17
        puts "Dealer takes one... (Enter to continue)"
        gets
        deck.deal_card_to(dealer)
      else
        puts "Dealer stays on #{dealer.total}!"
        break
      end
    end
  end

  def show_result
    p_total = player.total
    d_total = dealer.total

    if p_total > d_total
      puts "Player's #{p_total} beats the Dealer's #{d_total}! You win!"
    elsif p_total < d_total
      puts "Dealer's #{d_total} beats your #{p_total}. Better luck next time."
    else
      puts "It's a push!"
    end
  end
end

Game.new.start
