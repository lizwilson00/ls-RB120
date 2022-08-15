# RB120
# Exercises
# classes_and_objects_1.rb

=begin
# exercise 1
puts "Hello".class
puts 5.class
puts [1, 2, 3].class
=end

# exercise 2 and beyond
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
kitty.name = 'Luna'
kitty.greet
kitty.walk
