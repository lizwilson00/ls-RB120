# RB120
# Exercises
# Medium 1

=begin
# exercise 1
class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def get_status
    switch
  end

  private

  def flip_switch(desired_state)
    self.switch = desired_state
  end

  attr_accessor :switch
end

# exercise 2
class FixedArray
  attr_reader :array

  def initialize(size)
    @array = Array.new(size)
  end

  def [](index)
    array.fetch(index)
  end

  def []=(index, new_val)
    array.fetch(index)
    array[index] = new_val
  end

  def to_a
    array.clone
  end

  def to_s
    to_a.to_s
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end

# exercise 3
class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end

# exercise 4
# Problem:
# Create a queue to store data that is x elements long where x is the integer passed in initially

# Input: integer
# Output: array showing the current state of the queue

# Requirements
# Initial queue is empty

# There will be an "enqueue" function as follows:
# the user will be able to pass in one element as part of the function
# the data will be added after the most recently added element
# if the queue is empty the element will be added at the beginning of the queue
# if the queue is full then it will replace the oldest element
# input: integer
# output: nothing

# There will be a "dequeue" function as follows:
# No data will be passed in for this function
# The oldest element will be removed from the queue
# A placeholder will be added in its place
# The return value will be:
# nil if the queue is empty
# else it will be the oldest element that was removed
# input: nothing
# output: element that was removed or nil

# Data Structure
# Array will store the queue data
# Need to keep track of:
# where we should place the next element (enqueue)
# where we should remove the oldest element (dequeue)
# whether or not the queue is empty
# whether or not the queue is full

# Algorithm
# enqueue
# if the queue is empty then add the element to index 0
# if the queue is full:
    # run dequeue
    # add the element to the position 
# the data will be added after the most recently added element
# if the queue is empty the element will be added at the beginning of the queue
# if the queue is full then it will replace the oldest element

# Examples
# [nil, nil, nil] - All positions are initially empty
# next element - 0
# oldest element - 0
# [1, nil, nil] - Add 1 to the queue
# next element - 1 (increment by 1)
# oldest element - 0 (do not change)
# [1, 2, nil] - Add 2 to the queue
# next element - 2 (increment by 1)
# oldest element - 0 (do not change)
# [1, 2, 3] - Add 3 to the queue
# next element - 0 (back to 0 because we're adding something where index == size of the queue - 1)
# oldest element - 0 (do not change)
# next element == oldest element indicates either the queue is full or the queue is empty
# [4, 2, 3] - Add 4 to the queue
# call dequeue logic
# remove 1 from position next element (0)
# oldest element - 1 (increment by 1)
# back to enqueue logic
# add 4 to position next element (0)
# next element - 1 (increment by 1)
# [4, nil, 3] - Remove oldest item from queue (2)
# store 2 in a local variable so we can return later
# remove 2 from position oldest element (1)
# set position oldest element to nil
# oldest element - 2 (increment by 1)
# next element - 1 (do not change)



class CircularQueue
  def initialize(size)
    @queue_array = Array.new(size)
    @oldest_idx = 0
    @next_idx = 0
  end

  def dequeue
    # remove oldest item from the queue
    oldest_item = @queue_array[@oldest_idx]
    @queue_array[@oldest_idx] = nil
    @oldest_idx = increment(@oldest_idx) unless oldest_item.nil?
    # return oldest item
    oldest_item
  end

  def enqueue(new_element)
    # remove item first if full
    dequeue if full?
    # add to queue at index @next_idx
    @queue_array[@next_idx] = new_element
    @next_idx = increment(@next_idx)
  end

  private

  def increment(position)
    position == @queue_array.size - 1 ? 0 : position + 1
  end
  
  def empty?
    @queue_array.uniq == [nil]
  end

  def full?
    @queue_array.none?(nil)
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

# exercise 5
# Problem:
# Implement a stack and register based programming language with the following commands:
# n - places value n in the register
# PUSH - copies the register value to the stack, leave the value in the register
# ADD - removes the last value (pop) from the stack and adds it to the register value, storing the result in register
# SUB - similar to ADD, only subtract
# MULT - similar to ADD, only multiplies
# DIV - similar to ADD, only divides - need to be concerned with dividing by 0, also with how many decimal places to display
# MOD - similar to ADD, only calculates the modulo (remainder from division)
# POP - removes the topmost item from the stack and places it in register
# PRINT - outputs the register value to the screen

# Rules
# register can only hold one value
# stack can hold many values (perhaps use an array to store the values)
# all operations are integer operations
# must initialize the register to 0
# programs will be supplied via a string passed in as an argument
# program must produce an error if:
# an unexpected item is present in the string
# -or-
# if a required stack value is not on the stack when it should be (stack is empty)
# if an error occurs, no additional processing should be performed

# Input: string of commands separated by spaces
# Output: nothing unless PRINT command is included or an error occurs

# Program Example
# '5 PUSH 3 MULT PRINT'
# 5 - this is the 'n' command, place 5 in the register
# PUSH - this is the 'PUSH' command, copies 5 to the stack, 5 remains in the register
# 3 - this is the 'n' command, place 3 in the register
# MULT - this is the 'MULT' command
  # remove the last value from the stack (5)
  # multiply it by the register value (3)
  # storing result (15) in register
# PRINT
  # outputs 15 to the screen

# Algorithm
# parse the string to separate each command
# iterate through the commands, one by one

class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end
# class ZeroDivisionError < MinilangError; end

class Minilang
  attr_accessor :register
  
  def initialize(program)
    @program = program.strip.split
    @stack = []
    @register = 0
  end

  def eval
    @program.each do |command|
      if number?(command)
        number(command)
        next
      else
        case command
        when 'ADD' then add
        when 'SUB' then subtract
        when 'MULT' then multiply
        when 'DIV' then divide
        when 'MOD' then modulo
        when 'POP' then pop
        when 'PRINT' then print
        when 'STACK' then stack
        when 'PUSH' then push
        else
          raise BadTokenError, "Invalid token: #{command}"
        end
      end
    end
  end

  def number?(num)
    num =~ /\A[-+]?\d+\z/
  end

  
  # ADD - removes the last value (pop) from the stack and adds it to the register value, storing the result in register
  def add
    @register = @register + @stack.pop
  end

  # SUB - similar to ADD, only subtract
  def subtract
    @register = @register - @stack.pop
  end
  
  # MULT - similar to ADD, only multiplies
  def multiply
    @register = @register * @stack.pop
  end

  # DIV - similar to ADD, only divides - need to be concerned with dividing by 0, also with how many decimal places to display
  def divide
    raise ZeroDivisionError, "Cannot divide by zero!" if @stack.last == 0
    @register = @register / @stack.pop
  end

  # MOD - similar to ADD, only calculates the modulo (remainder from division)
  def modulo
    @register = @register % @stack.pop
  end

  # POP - removes the topmost item from the stack and places it in register
  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  # STACK - outputs the stack
  def stack
    p @stack
  end

  # PRINT - outputs the register value to the screen
  def print
    puts @register
  end

  # n - places value n in the register
  def number(command)
    @register = command.to_i
  end

  # PUSH - copies the register value to the stack, leave the value in the register
  def push
    @stack.push(@register)
  end

end


# Minilang.new('PRINT').eval
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
# Empty stack!

# testing divide by zero
# can't get the program to stop executing
Minilang.new('0 PUSH 5 DIV PRINT').eval

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

# Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
=end

# exercise 6
class GuessingGame
  MAX_GUESSES = 7
  LOW_NUM = 1
  HIGH_NUM = 100
  
  def initialize
  end

  def play
    @num_guesses = MAX_GUESSES
    @target_num = (LOW_NUM..HIGH_NUM).to_a.sample
    @guess = nil
    loop do
      display_num_guesses
      display_guess_result
      @num_guesses -= 1
      break if winner? || @num_guesses == 0
    end
    display_final_result
  end

  def display_num_guesses
    puts "You have #{@num_guesses} guesses remaining."
    puts "Enter a number between #{LOW_NUM} and #{HIGH_NUM}: "
    loop do
      @guess = gets.chomp.to_i
      break if (LOW_NUM..HIGH_NUM).to_a.include?(@guess)
      puts "Invalid guess.  Enter a number between #{LOW_NUM} and #{HIGH_NUM}."
    end
  end

  def display_guess_result
    if winner?
      puts "That's the number!"
    elsif @guess < @target_num
      puts "Your guess is too low."
    else
      puts "Your guess is too high."
    end
  end

  def winner?
    @guess == @target_num
  end

  def display_final_result
    if winner?
      puts "You won!"
    else
      puts "You have no more guesses.  You lost.  The number was #{@target_num}."
    end
  end
end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!