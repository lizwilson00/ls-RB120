# RB120
# Exercises
# Second pass

=begin
# problem 1
puts "Hello".class
puts 5.class
puts [1, 2, 3].class

# problem 2
class Cat
end

kitty = Cat.new
puts kitty

# problem 3
class Cat
  def initialize
    puts "I'm a cat!"
  end
end

kitty = Cat.new
=end

# problem 4 - 10
module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.walk