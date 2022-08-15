=begin
Rock, Paper, Scissors is a two-player game where each player chooses
one of three possible moves: rock, paper, or scissors. The chosen moves
will then be compared to see who wins, according to the following rules:

- rock beats scissors
- scissors beats paper
- paper beats rock

If the players chose the same move, then it's a tie.

Keep track of a history of moves:
Output:
Player's Move History:
Game 1: ['rock', 'spock', 'paper',...]
Game 2: ['paper', 'spock', 'scissors',...]

Computer's Move History:
Game 1: ['lizard', 'rock', 'paper',...]
Game 2: ['scissors', 'spock', 'paper',...]

Store in a nested array
=end

TOTAL_POINTS = 2

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def rock_wins?(other_move)
    rock? && other_move.scissors? ||
      rock? && other_move.lizard?
  end

  def paper_wins?(other_move)
    paper? && other_move.rock? ||
      paper? && other_move.spock?
  end

  def scissors_wins?(other_move)
    scissors? && other_move.paper? ||
      scissors? && other_move.lizard?
  end

  def lizard_wins?(other_move)
    lizard? && other_move.paper? ||
      lizard? && other_move.spock?
  end

  def spock_wins?(other_move)
    spock? && other_move.rock? ||
      spock? && other_move.scissors?
  end

  def >(other_move)
    rock_wins?(other_move) ||
      paper_wins?(other_move) ||
      scissors_wins?(other_move) ||
      lizard_wins?(other_move) ||
      spock_wins?(other_move)
  end

  def rock_loses?(other_move)
    rock? && other_move.paper? ||
      rock? && other_move.spock?
  end

  def paper_loses?(other_move)
    paper? && other_move.scissors? ||
      paper? && other_move.lizard?
  end

  def scissors_loses?(other_move)
    scissors? && other_move.rock? ||
      scissors? && other_move.spock?
  end

  def lizard_loses?(other_move)
    lizard? && other_move.rock? ||
      lizard? && other_move.scissors?
  end

  def spock_loses?(other_move)
    spock? && other_move.paper? ||
      spock? && other_move.lizard?
  end

  def <(other_move)
    rock_loses?(other_move) ||
      paper_loses?(other_move) ||
      scissors_loses?(other_move) ||
      lizard_loses?(other_move) ||
      spock_loses?(other_move)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score, :all_move_history, :game_move_history

  def initialize
    set_name
    @score = 0
    @all_move_history = []
    @game_move_history = []
  end

  def add_to_game_history
    game_move_history << move.value
  end

  def add_to_all_history
    all_move_history << game_move_history
  end

  def clear_game_move_history
    self.game_move_history = []
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class R2D2 < Computer
  def set_name
    self.name = 'R2D2'
  end

  def choose
    self.move = Move.new('rock')
  end
end

class Hal < Computer
  def set_name
    self.name = 'Hal'
  end

  def choose
    weights = [0.06, 0, 0.5, 0.22, 0.22]
    loaded_choice = Move::VALUES.zip(weights).to_h
    self.move = Move.new(loaded_choice.max_by { |_, weight| rand ** (1.0 / weight) }.first)
  end
end

class Chappie < Computer
  def set_name
    self.name = 'Chappie'
  end
end

class Sonny < Computer
  def set_name
    self.name = 'Sonnie'
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = [R2D2.new, Hal.new, Chappie.new, Sonny.new].sample
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "The first player to #{TOTAL_POINTS} points wins."
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock.  Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def determine_winner
    if human.move > computer.move
      'human'
    elsif human.move < computer.move
      'computer'
    else
      'tie'
    end
  end

  def display_winner
    case determine_winner
    when 'human'
      puts "#{human.name} won!"
    when 'computer'
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def update_score
    case determine_winner
    when 'human'
      human.score += 1
    when 'computer'
      computer.score += 1
    end
  end

  def display_score(final = false)
    type_of_score = final == true ? 'Final' : 'Current'
    puts "----------#{type_of_score} Score----------"
    puts "#{human.name}: #{human.score}, #{computer.name}: #{computer.score}"
    puts "#{'-' * type_of_score.length}#{'-' * 26}"
  end

  def display_history
    puts "----------Move History----------"
    puts "#{human.name}:"
    (1..human.all_move_history.length).each do |game_num|
      puts "Game #{game_num}: #{human.all_move_history[game_num - 1].join(', ')}"
    end
    puts "#{computer.name}:"
    (1..computer.all_move_history.length).each do |game_num|
      puts "Game #{game_num}: #{computer.all_move_history[game_num - 1].join(', ')}"
    end
    puts "#{'-' * 32}"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n."
    end

    return false if answer == 'n'
    return true if answer == 'y'
  end

  def play_round
    human.choose
    human.add_to_game_history
    computer.choose
    computer.add_to_game_history
    display_moves
    display_winner
    update_score
  end

  def play_full_game
    loop do
      play_round
      break if game_finished?
      display_score
    end
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def game_finished?
    human.score == TOTAL_POINTS || computer.score == TOTAL_POINTS
  end

  def history_clean_up
    human.add_to_all_history
    computer.add_to_all_history
    human.clear_game_move_history
    computer.clear_game_move_history
  end

  def play
    display_welcome_message

    loop do
      play_full_game
      display_score(true)
      reset_score
      history_clean_up
      display_history
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
