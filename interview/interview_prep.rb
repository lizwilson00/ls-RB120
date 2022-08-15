# Marwan's Medium article
# question 1
# class Student
#   attr_reader :id

#   def initialize(name)
#     @name = name
#     @id
#   end

#   def id=(value)
#     @id = value
#   end
# end

# tom = Student.new("Tom")
# p tom.id = 45

# question 2
# Constructor method that initializes 2 instance variables.
# Instance method that outputs an interpolated string of those variables.
# Getter methods for both (you can use the shorthand notation if you want).
# Prevent instances from accessing these methods outside of the class.
# Finally, explain what concept(s) you’ve just demonstrated with your code.

# class Person
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end

#   def to_s
#     "My name is #{name} and my age is #{age}"
#   end

#   private

#   attr_reader :name, :age
# end

# bob = Person.new('Bob', 40)
# puts bob
# p bob.name
# p bob.age

# Encapsulation
# Method Access Control

# question 3
# module Greet
#   def greet(message)
#     puts message
#   end
# end

# class Teacher
#   include Greet
# end

# class Student
#   include Greet
# end

# tom = Teacher.new
# rob = Student.new

# tom.greet "Bonjour!"
# rob.greet "Hello!"

# Polymorphism through mixin

# question 4
# class Student
#   def initialize(id, name)
#     @id = id
#     @name = name
#   end
  
#   def ==(other)
#     id == other.id
#   end

#   protected
  
#   attr_reader :id, :name
# end

# rob = Student.new(123, "Rob")
# tom = Student.new(456, "Tom")

# p rob == tom

# Private vs protected

# question 5
# class Foo
#   def self.method_a
#     "Justice" + all
#   end

#   def self.method_b(other)
#     "Justice" + other.exclamate
#   end

#   private

#   def self.all
#     " for all"
#   end

#   def self.exclamate
#     all + "!!!"
#   end
# end

# foo = Foo.new
# puts Foo.method_a
# puts Foo.method_b(Foo)

# question 6
# class Person
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#      "Hello! they call me #{name}"
#   end
# end

# class Puppet < Person
#   def initialize(name)
#     super
#   end

#   def greet(message)
#     puts super() + message
#   end
# end

# puppet = Puppet.new("Cookie Monster")
# puppet.greet(" and I love cookies!")

# question 7
# class Bird
#   def fly
#     p "#{self.class} is flying!"
#   end
# end

# class Pigeon < Bird; end
# class Duck < Bird; end

# birds = [Bird.new, Pigeon.new, Duck.new].each(&:fly)
# Polymorphism by inheritance

# question 8
# class Dog
#   attr_accessor :name

#   def good
#     self.name + " is a good dog"
#   end
# end

# bandit = Dog.new
# bandit.name = "Bandit"
# p bandit.good

# question 9
# class Song
#   attr_reader :title, :artist

#   def initialize(title)
#     @title = title
#     @artist
#   end

#   def artist=(name)
#     @artist = name.upcase!
#   end
# end

# p song = Song.new("Superstition")
# p song.artist = "Stevie Wonder"
# p song.artist
# p song

# Setter methods always return the argument that was passed in
# unless the argument is mutated in the method body

# question 10
# class Song
#   attr_reader :title, :artist

#   def initialize(title)
#     @title = title
#   end

#   def artist=(name)
#     @artist = name
#     name.upcase!
#   end
# end

# song = Song.new("Superstition")
# p song.artist = "Stevie Wonder"
# p song.artist

# question 11
# class Cat
#   attr_accessor :name

#   def set_name
#     self.name = "Cheetos"
#   end
# end

# cat = Cat.new
# p cat.set_name
# p cat.name
# p cat

# question 12
# module Walk
#   STR = "Walking"
# end

# module Run
#   STR = "Running"
# end

# module Jump
#   STR = "Jumping"
# end

# class Bunny
#   include Jump
#   include Walk
#   include Run
# end

# class Bugs < Bunny; end

# p Bugs.ancestors
# # Bugs; Bunny; Run; Walk; Jump; Object; Kernel; BasicObject
# p Bugs::STR

# question 13
# VAL = 'Global'

# module Foo
#   VAL = 'Local'

#   class Bar
#     def value1
#       VAL
#     end
#   end
# end

# class Foo::Bar
#   def value2
#     VAL
#   end
# end

# p test1 = Foo::Bar.new
# p test1.value1
# p test2 = Foo::Bar.new
# p test2.value2
# This is confusing

# question 14
# class Person
#   attr_reader :friends
  
#   def initialize
#     @friends = []
#   end

#   def <<(new_friend)
#     @friends << new_friend.name
#   end

#   def []=(idx, new_friend)
#     @friends[idx] = new_friend.name
#   end

#   def [](idx)
#     @friends[idx]
#   end
# end

# class Friend
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end
# end

# tom = Person.new
# john = Friend.new('John')
# amber = Friend.new('Amber')

# tom << amber
# tom[1] = john
# p tom[0]      # => Amber
# p tom.friends # => ["Amber", "John"]

# question 15
# class Foo
#   @@var = 1

#   def self.var
#     @@var
#   end
# end

# class Bar < Foo
#   @@var = 2
# end

# puts Foo.var 
# puts Bar.var 

# Class variables with inheritance
# The class variable is shared across all classes 
# When a subclass initializes the class variable differently than
# the superclass, that value will be returned for all calls
# to the class variable

# question 16
# Problem taken from tinyurl.com/mr42tf4t, creator: Raul Romero

# class Human 
#   attr_reader :name

#   def initialize(name="Dylan")
#     @name = name
#   end

#   def hair_color(color)
#     "Hi, my name is #{name} and I have #{color} hair."
#   end

#   def self.hair_color(color)
#     color = "blonde" if color.empty?
#     "Hi, my name is Dylan and I have #{color} hair."
#   end
# end

# puts Human.new("Jo").hair_color("blonde")  
# # Should output "Hi, my name is Jo and I have blonde hair."

# puts Human.hair_color("")              
# # Should "Hi, my name is Dylan and I have blonde hair."

# question 17
# class MeMyselfAndI
#   self # class

#   def self.me # class
#     self # class
#   end

#   def myself
#     self # instance
#   end
# end

# i = MeMyselfAndI.new

# question 18
# Characteristics of instance variables
