# RB120
# lesson_5
# twenty_one.rb

module Hand
  SUM_TARGET = 21

  def show_hand
    puts "-----#{name}'s Cards-----"
    hand.each(&:display_card)
    puts "Total: #{total_points}"
    puts ""
  end
  
  def total_points
    sum = 0
    sum += hand.select { |c| !c.hidden }.map(&:points).inject(:+)
    num_aces = hand.select { |c| !c.hidden && c.value == 'A' }.length
    while sum > SUM_TARGET && num_aces > 0
      sum -= 10
      num_aces -= 1
    end
    sum
  end

  def busted?
    total_points > SUM_TARGET
  end

  def blackjack?
    total_points == SUM_TARGET
  end

  def display_hand_status
    if blackjack?
      puts "#{name} has blackjack!"
    elsif busted?
      puts "#{name} busted!"
    else
      puts "#{name} stayed at #{total_points}"
    end
  end
end

class Participant
  include Hand

  attr_accessor :hand, :name

  def initialize
    @hand = []
    set_name
  end
end

class Player < Participant
  def set_name
    player_name = ''
    loop do
      puts "What is your name?"
      player_name = gets.chomp
      break if !player_name.empty?
      puts "Sorry, must enter a name."
    end
    self.name = player_name
  end
end

class Dealer < Participant
  DEALER_NAMES = ['Raw Deal', 'Dream Crusher', 'King of Dealers', 'Card Shark']

  def set_name
    self.name = DEALER_NAMES.sample
  end
end

class Deck
  SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  attr_accessor :current_deck

  def initialize
    @current_deck = create_shuffled_deck
  end

  def create_shuffled_deck
    deck = []
    SUITS.each do |suit|
      VALUES.each do |value|
        deck << Card.new(suit, value)
      end
    end
    deck.shuffle
  end

  def deal(player)
    player.hand << current_deck.pop
  end
end

class Card
  POINTS = { 'A' => 11, 'J' => 10, 'Q' => 10, 'K' => 10 }

  attr_reader :suit, :value, :points
  attr_accessor :hidden

  def initialize(suit, value)
    # what are the "states" of a card?
    @suit = suit
    @value = value
    @hidden = nil
    @points = assign_points
  end

  def display_card
    if hidden
      puts "?????"
    else
      puts "#{value} of #{suit}"
    end
  end

  def assign_points
    if POINTS.keys.include?(value)
      POINTS[value]
    else
      value.to_i
    end
  end
end

class Game
  attr_accessor :deck, :human, :dealer

  def initialize
    @deck = Deck.new
    @human = Player.new
    @dealer = Dealer.new
  end

  def start
    display_welcome_message
    introduce_dealer
    play_round
    display_goodbye_message
  end

  def display_welcome_message
    puts "Welcome to Twenty One!"
  end

  def introduce_dealer
    puts "Your dealer is #{dealer.name}."
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Twenty One! Goodbye!"
  end

  def play_round
    loop do
      deal_cards
      show_initial_cards
      player_turn
      dealer_turn unless human.busted?
      show_result
      break unless play_again?
      reset
    end
  end

  def deal_cards
    2.times do
      deck.deal(human)
      deck.deal(dealer)
    end
    set_hidden_dealer_card
  end

  def set_hidden_dealer_card
    dealer.hand.last.hidden = true
  end

  def unset_hidden_dealer_card
    dealer.hand.last.hidden = false
  end

  def show_initial_cards
    human.show_hand
    dealer.show_hand
  end

  def player_turn
    loop do
      break if human.blackjack? || human.busted?
      break if hit_or_stay == 's'
      deck.deal(human)
      human.show_hand
    end
    human.display_hand_status
  end

  def hit_or_stay
    selection = ''
    loop do
      puts "Would you like to (h)it or (s)tay?"
      selection = gets.chomp.downcase
      break if ['h', 's'].include?(selection)
      puts "Sorry, that is not valid."
    end
    selection
  end

  def dealer_turn
    puts ""
    puts "Dealer's turn!"
    unset_hidden_dealer_card
    loop do
      break if dealer.total_points >= 17
      deck.deal(dealer)
    end
    dealer.show_hand
    dealer.display_hand_status
  end

  def show_result
    puts ""
    case calculate_winner
    when 'tie'
      puts "It's a tie!"
    when 'dealer'
      puts "#{dealer.name} won!"
    else
      puts "#{human.name} won!"
    end
  end

  def calculate_winner
    if human.busted? then 'dealer'
    elsif dealer.busted? then 'human'
    elsif dealer.total_points < human.total_points then 'human'
    elsif dealer.total_points > human.total_points then 'dealer'
    else 'tie'
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

  def reset
    self.deck = Deck.new
    human.hand = []
    dealer.hand = []
  end
end

Game.new.start
