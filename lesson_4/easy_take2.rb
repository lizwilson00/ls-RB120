# RB120
# Lesson 4
# Easy 1
# Take 2

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed
  
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   include Speed
  
#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

# Car.new.go_fast
# Truck.new.go_fast

# Easy 2
# Take 2
# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# class RoadTrip < Oracle
#   def choices
#     ["visit Vegas", "fly to Fiji", "romp in Rome"]
#   end
# end

# trip = RoadTrip.new
# p trip.predict_the_future

# module Taste
#   def flavor(flavor)
#     puts "#{flavor}"
#   end
# end

# class Orange
#   include Taste
# end

# class HotSauce
#   include Taste
# end

# p Orange.ancestors
# p HotSauce.ancestors

# class Cat
#   @@cats_count = 0

#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end

#   def self.cats_count
#     @@cats_count
#   end
# end

# cat1 = Cat.new('tabby')
# p Cat.cats_count
# cat2 = Cat.new('calico')
# p Cat.cats_count

# Easy 3
# Take 2
# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end

#   def self.hi
#     "Hello"
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# p Hello.hi

# class AngryCat
#   def initialize(type)
#     @type = type
#   end

#   def type
#     @type
#   end

#   def hiss
#     puts "Hisssss!!!"
#   end

#   def to_s
#     "I am a #{type} cat"
#   end
# end

# alex   = AngryCat.new("tabby")
# puts alex

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model