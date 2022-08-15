# RB120
# Exercises
# medium_1.rb

require "pry"

=begin
# exercise 1
class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def switch_state
    switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

my_machine = Machine.new
my_machine.start
p my_machine.switch_state
my_machine.stop
p my_machine.switch_state
p my_machine.switch # private method error
=end

# exercise 2
# class FixedArray
#   attr_accessor :array
  
#   def initialize(length)
#     @array = [nil] * length
#   end

#   def [](idx)
#     array.fetch(idx)
#   end

#   def []=(idx, new_val)
#     array[idx] = new_val if array.fetch(idx) == nil || array.fetch(idx)
#   end

#   def to_a
#     array.clone
#   end

#   def to_s
#     to_a.to_s
#   end
# end

# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# exercise 3
# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate < Student
#   def initialize(name, year, parking)
#     super(name, year)
#     @parking = parking
#   end
# end

# class Undergraduate < Student; end

# exercise 4
# class CircularQueue
#   attr_accessor :queue_arr
#   attr_reader :queue_len
  
#   def initialize(queue_len)
#     @queue_len = queue_len
#     @curr_idx = 0
#     @oldest_idx = 0
#     @queue_arr = Array.new(queue_len)
#   end

#   def enqueue(new_obj)
#     if queue_arr[@curr_idx]
#       dequeue
#     end
#     queue_arr[@curr_idx] = new_obj
#     @curr_idx = increment(@curr_idx)
#   end

#   def dequeue
#     removed_val = queue_arr[@oldest_idx]
#     queue_arr[@oldest_idx] = nil
#     @oldest_idx = increment(@oldest_idx) unless removed_val.nil?
#     removed_val
#   end

#   def increment(position)
#     (position + 1) % queue_len
#   end

#   def to_a
#     queue_arr.clone
#   end
# end

# # P1	P2	P3	Comments
# # All positions are initially empty
# # 1			Add 1 to the queue (curr_idx 1, oldest_idx 0)
# # 1	2		Add 2 to the queue (curr_idx 2, oldest_idx 0)
# # 2		Remove oldest item from the queue (1) (curr_idx 2, oldest_idx 1)
# # 2	3	Add 3 to the queue (curr_idx 0, oldest_idx 1)
# # 4	2	3	Add 4 to the queue, queue is now full (curr_idx 1, oldest_idx 1)
# # 4		3	Remove oldest item from the queue (2) (curr_idx 1, oldest_idx 2)
# # 4	5	3	Add 5 to the queue, queue is full again (curr_idx 2, oldest_idx 2)
# # 4	5	6	Add 6 to the queue, replaces oldest element (3) (also removes) (curr_idx 0, oldest_idx 0)
# # 7	5	6	Add 7 to the queue, replaces oldest element (4) (also removes) (curr_idx 1, oldest_idx 1)
# # 7		6	Remove oldest item from the queue (5) (curr_idx 1, oldest_idx 2)
# # 7			Remove oldest item from the queue (6) (curr_idx 1, oldest_idx 0)
# # Remove oldest item from the queue (7) (curr_idx 1, oldest_idx 1)
# # Remove non-existent item from the queue (nil)

# # further exploration
# # empty array, arr
# # P1	P2	P3	Comments
# # All positions are initially empty
# # 1			Add 1 to the queue arr.push
# # 1	2		Add 2 to the queue arr.push
# # 2		Remove oldest item from the queue (1) arr.shift
# # 2	3	Add 3 to the queue arr.push
# # 4	2	3	Add 4 to the queue, queue is now full arr.push
# # 4		3	Remove oldest item from the queue (2) 
# # 4	5	3	Add 5 to the queue, queue is full again
# # 4	5	6	Add 6 to the queue, replaces oldest element (3)
# # 7	5	6	Add 7 to the queue, replaces oldest element (4)
# # 7		6	Remove oldest item from the queue (5)
# # 7			Remove oldest item from the queue (6)
# # Remove oldest item from the queue (7)
# # Remove non-existent item from the queue (nil)

# class CircularQueue
#   def initialize(len)
#     @arr = []
#     @len = len
#   end

#   def enqueue(new_obj)
#     dequeue if full? 
#     @arr.push(new_obj)
#   end

#   def dequeue
#     return nil if empty?
#     @arr.shift
#   end

#   def full?
#     @arr.length == @len
#   end

#   def empty?
#     @arr == []
#   end
# end


# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# exercise 5
# class MinilangError < StandardError; end
# class BadTokenError < MinilangError; end
# class EmptyStackError < MinilangError; end

# class Minilang
#   VALID_COMMANDS = %w(PRINT PUSH ADD SUB MULT DIV MOD POP)
  
#   def initialize(commands)
#     @commands = commands
#   end
  
#   def eval
#     @register = 0
#     @stack = []
#     @commands.split.each { |command| eval_command(command) }
#   rescue MinilangError => error
#     puts error.message
#   end

#   private

#   def eval_command(command)
#     if VALID_COMMANDS.include?(command)
#       send(command.downcase)
#     elsif command =~ /\A[-+]?\d+\z/
#       @register = command.to_i
#     else
#       raise BadTokenError, "Invalid token: #{command}"
#     end
#   end

#   def push
#     @stack.push(@register)
#   end

#   def pop
#     raise EmptyStackError, "Empty stack!" if @stack.empty?
#     @register = @stack.pop
#   end

#   def add
#     @register += @stack.pop
#   end

#   def sub
#     @register -= @stack.pop
#   end

#   def mult
#     @register *= @stack.pop
#   end

#   def div
#     @register /= @stack.pop
#   end

#   def mod
#     @register %= @stack.pop
#   end

#   def print
#     puts @register.to_s
#   end
# end

# # Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)

# CENTIGRADE_TO_FAHRENHEIT =
#   '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
# Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: 100)).eval
# # 212
# Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: 0)).eval
# # 32
# Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: -40)).eval
# # -40

# exercise 6 and 7
# class Player
# end

# class GuessingGame
#   attr_reader :player, :target_num, :total_guesses, :min_num, :max_num
#   attr_accessor :num_guesses, :guess
  
#   def initialize(min_num, max_num)
#     @min_num = min_num
#     @max_num = max_num
#     @target_num = (min_num..max_num).to_a.sample
#     @num_guesses = 0
#     @total_guesses = Math.log2(max_num - min_num + 1).to_i + 1
#   end

#   def play
#     loop do
#       display_num_guesses
#       player_guesses
#       display_high_low
#       increment_guess
#       break if end_game?
#     end
    
#     display_result
#   end

#   def remaining_guesses
#     total_guesses - num_guesses
#   end

#   def display_num_guesses
#     puts "You have #{remaining_guesses} guesses remaining."
#   end
  
#   def player_guesses
#     pl_guess = ''
#     loop do
#       puts "Enter a number between #{min_num} and #{max_num}: "
#       pl_guess = gets.chomp.to_i
#       break if valid_num?(pl_guess)
#       puts "Sorry, that is not valid."
#     end
#     self.guess = pl_guess
#   end

#   def valid_num?(pl_guess)
#     (min_num..max_num).to_a.include?(pl_guess)
#   end

#   def display_high_low
#     if guess < target_num
#       puts "Your guess is too low."  
#     elsif guess > target_num
#       puts "Your guess is too high."
#     elsif guess == target_num
#       puts "That's the number!"
#     else
#       puts "Something went wrong."
#     end
#   end

#   def increment_guess
#     self.num_guesses += 1
#   end

#   def end_game?
#     guess == target_num || num_guesses == total_guesses
#   end

#   def display_result
#     if guess == target_num && num_guesses <= total_guesses
#       puts "You won!"
#     else
#       puts "You have no more guesses. You lost!"
#     end
#   end
# end


# game = GuessingGame.new(1, 25)
# game.play

# exercise 8, 9, and 10
class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_accessor :cards

  def initialize
    reset_deck
  end

  def draw
    reset_deck if cards.empty?
    cards.pop
  end

  def reset_deck
    @cards = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end
end

class Card
  include Comparable
  
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def rank_points
    case @rank
    when 'Jack'   then 11
    when 'Queen'  then 12
    when 'King'   then 13
    when 'Ace'    then 14
    else               
      @rank
    end
  end

  def <=>(other)
    rank_points <=> other.rank_points
  end
end

class PokerHand
  ROYAL_FLUSH_HAND = [10, 'Jack', 'Queen', 'King', 'Ace']
  
  attr_reader :hand, :deck, :rank_hash
  
  def initialize(deck)
    @deck = deck
    deal_hand
  end

  def deal_hand
    @hand = []
    @rank_hash = Hash.new(0)
    5.times do 
      card = deck.draw
      hand << card
      @rank_hash[card.rank] += 1
    end
  end

  def print
    hand.each { |card| puts card }
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def sequences
    seq_arr = []
    (0..Deck::RANKS.length - 5).each do |st_idx|
      seq_arr << Deck::RANKS[st_idx, 5]
    end
    seq_arr << ['Ace', 2, 3, 4, 5]
  end

  def n_of_a_kind?(num)
    rank_hash.values.one? { |i| i == num }
  end

  def royal_flush?
    hand.map(&:suit).uniq.size == 1 && 
      hand.sort.map(&:rank) == ROYAL_FLUSH_HAND
  end

  def straight_flush?
    hand.map(&:suit).uniq.size == 1 && 
      sequences.any? { |seq| seq == hand.sort.map(&:rank) }
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    hand.map(&:rank).group_by{ |r| r }.count == 2
  end

  def flush?
    hand.map(&:suit).uniq.size == 1
  end

  def straight?
    sequences.any? { |seq| seq == hand.sort.map(&:rank) }
  end

  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def two_pair?
    rank_hash.values.select { |i| i == 2 }.size == 2
  end

  def pair?
    n_of_a_kind?(2)
  end
end

# cards = [Card.new(2, 'Hearts'),
#   Card.new(10, 'Diamonds'),
#   Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#   Card.new(4, 'Diamonds'),
#   Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#   Card.new('Jack', 'Diamonds'),
#   Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#   Card.new(8, 'Clubs'),
#   Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8

# exercise 9
# deck = Deck.new
# drawn = []
# 52.times { drawn << deck.draw }
# p drawn.count { |card| card.rank == 5 } == 4
# p drawn.count { |card| card.suit == 'Hearts' } == 13

# drawn2 = []
# 52.times { drawn2 << deck.draw }
# p drawn != drawn2 # Almost always.

# exercise 10
hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

