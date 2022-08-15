# RB120
# lesson_5
# ttt_game_bonus.rb

require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                   [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                   [1, 5, 9], [3, 5, 7]]            # diagonals

  attr_accessor :current_player, :squares

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  attr_accessor :name

  def initialize(marker)
    @marker = marker
    set_name
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
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny'].sample
  end
end

class TTTGame
  # HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  PLAY_TO_SCORE = 5

  @@human_score = 0
  @@computer_score = 0

  attr_reader :board, :computer
  attr_accessor :human

  def initialize
    @board = Board.new
    @human = nil
    @computer = Computer.new(COMPUTER_MARKER)
    @current_marker = nil
  end

  def play
    clear
    display_welcome_message
    display_computer_name
    display_and_initialize_player
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      who_goes_first
      clear_screen_and_display_board
      player_move
      update_score
      display_result
      break if someone_won_match?
      reset
    end
  end

  def player_move
    loop do
      current_player_moves
      # binding.pry
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe! The first player to #{PLAY_TO_SCORE} wins!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_and_initialize_player
    puts "#{computer.name}'s marker is 'O'."
    puts "Please enter your favorite one character marker."
    human_marker = nil
    loop do
      human_marker = gets.chomp
      break if human_marker.upcase != 'O' && human_marker.length == 1
      puts "Sorry, that's not a valid choice."
    end

    self.human = Human.new(human_marker)
  end

  def display_computer_name
    puts "The computer's name is #{computer.name}."
  end

  def display_select_who_goes_first
    puts "Who goes first?  1 - #{human.name}, 2 - #{computer.name}, \
or 3 - #{computer.name} chooses"
    select_first_player = nil
    loop do
      select_first_player = gets.chomp.to_i
      break if [1, 2, 3].include?(select_first_player)
      puts "Sorry, that's not a valid choice."
    end

    select_first_player == 3 ? [1, 2].sample : select_first_player
  end

  def display_and_set_first_player_marker
    selection = display_select_who_goes_first
  
    @current_marker = if selection == 1
                        human.marker
                      elsif selection == 2
                        computer.marker
                      end
  end

  def display_who_goes_first
    case @current_marker
    when human.marker
      puts "#{human.name} gets to go first!"
    else
      puts "#{computer.name} gets to go first."
    end
    puts "Press any key to continue."
    gets.chomp 
  end

  def who_goes_first
    display_and_set_first_player_marker
    display_who_goes_first
  end

  def display_board
    puts "#{human.name} is a(n) #{human.marker}, \
#{computer.name} is a(n) #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def joinor(unmarked_keys, delim = ', ', word_sep = 'or')
    case unmarked_keys.size
    when 0 then ''
    when 1 then unmarked_keys.first
    when 2 then unmarked_keys.join(" #{word_sep} ")
    else
      or_delim = "#{delim}or "
      first_items = unmarked_keys[0...-1]
      "#{first_items.join(delim)}#{or_delim}#{unmarked_keys.last}"
    end
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def middle_available?
    board.unmarked_keys.include?(5)
  end

  def best_computer_move
    if win_move = find_best_square(computer.marker) then win_move
    elsif block_move = find_best_square(human.marker) then block_move
    elsif middle_available? then 5
    else
      nil
    end
  end

  def computer_moves
    if best_computer_move
      board[best_computer_move] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def find_best_square(marker_type)
    Board::WINNING_LINES.each do |line|
      squares = board.squares.values_at(*line)
      same_marker_sq_cnt = squares.collect(&:marker).count(marker_type)
      empty_squares = line.select { |num| board.unmarked_keys.include?(num) }
      if same_marker_sq_cnt == 2 && empty_squares.first
        return empty_squares.first
      end
    end
    nil
  end

  def display_result
    clear_screen_and_display_board
    display_message
    display_score
    unless someone_won_match?
      puts "Press any key to continue."
      gets.chomp
    end
  end

  def display_message
    case board.winning_marker
    when human.marker then puts "#{human.name} won!"
    when computer.marker then puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score
    curr_or_final = someone_won_match? ? "Final" : "Current"
    puts "-----#{curr_or_final} Score-----"
    puts "#{human.name}: #{@@human_score}"
    puts "#{computer.name}: #{@@computer_score}"
    puts '-' * (curr_or_final.length + 16)
  end

  def update_score
    case board.winning_marker
    when human.marker
      @@human_score += 1
    when computer.marker
      @@computer_score += 1
    end
  end

  def someone_won_match?
    @@human_score == PLAY_TO_SCORE || @@computer_score == PLAY_TO_SCORE
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    @current_marker = @current_marker
    clear
  end
  
end

game = TTTGame.new
game.play
