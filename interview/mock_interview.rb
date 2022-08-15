# Mock Interview
# What is Object Oriented Programming?  What are the benefits of it?

# Tell me more about classes and objects and provide an example

# Describe encapsulation and method access control and provide an example
# class Person
#   def initialize(name, address, balance)
#     @name = name
#     @address = address
#     @balance = balance
#   end

#   def change_name(new_name)
#     self.name=(new_name)
#   end

#   def name
#     @name
#   end

#   def >(other)
#     balance > other.balance
#   end

#   private

#   def name=(new_name)
#     @name = new_name
#   end

#   attr_reader :balance
# end

# bob = Person.new('Bob', '123 Main Street', 1000)
# p bob
# bob.change_name('Robert')
# p bob.name

# mike = Person.new('Mike', '234 Main Street', 2000)
# p mike > bob
# p mike.balance

# When would I use modules vs inheritance and provide an example
# module Swimmable
#   def swims
#     "I'm swimming!"
#   end
# end

# class Animal
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end

#   def sleep
#   end
# end

# class Cat < Animal
#   def purrs
#   end
# end

# class Dog < Animal
#   include Swimmable
  
#   def barks
#   end
# end

# class Fish < Animal
#   include Swimmable
# end

# nemo = Fish.new('Nemo', 1)
# p nemo.swims

# Explain the difference between a class variable and an instance variable and provide an example
# class Animal
#   @@num_animals = 0
  
#   def initialize(name, age)
#     @name = name
#     @age = age
#     @@num_animals += 1
#   end

#   def sleep
#   end

#   def self.num_animals
#     @@num_animals
#   end
# end

# nemo = Animal.new('Nemo', 1)
# dorrie = Animal.new('Dorrie', 5)
# p Animal.num_animals

# Why would I not want to use class variables with inheritance and provide an example
# class Vehicle
#   WHEELS = 4

#   def initialize(make)
#     @make = make
#   end

#   def num_wheels
#     self.class::WHEELS
#   end
# end

# class Motorcycle < Vehicle
#   WHEELS = 2
# end

# class Car < Vehicle
#   WHEELS = 4
# end

# mycar = Car.new('Honda')
# mymoto = Motorcycle.new('BMW')
# p mycar.num_wheels
# p mymoto.num_wheels

# What is a fake operator and provide an example of how to utilize them
# class Person
#   def initialize(name, address, balance)
#     @name = name
#     @address = address
#     @balance = balance
#   end

#   def change_name(new_name)
#     self.name=(new_name)
#   end

#   def name
#     @name
#   end

#   def ==(other)
#     balance == other.balance
#   end

#   private

#   def name=(new_name)
#     @name = new_name
#   end

#   protected

#   attr_reader :balance
# end

# bob = Person.new('Bob', '123 Main Street', 1000)
# mike = Person.new('Mike', '234 Main Street', 1000)
# p mike == bob
# p mike.balance
# p Person.ancestors

# What is polymorphism and provide an example
# module Swimmable
#   def swims
#     "I'm swimming!"
#   end
# end

# class Animal
#   attr_reader :name
  
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end

#   def sleep
#   end

#   def talk
#     'Talking'
#   end
# end

# class Cat < Animal
#   def purrs
#   end

#   def talk
#     'Purring'
#   end
# end

# class Dog < Animal
#   include Swimmable
  
#   def barks
#   end

#   def talk
#     'Barking'
#   end
# end

# class Fish < Animal
#   include Swimmable

#   def talk
#     'Silent communication'
#   end
# end

# nemo = Fish.new('Nemo', 1)
# fido = Dog.new('Fido', 2)
# dorrie = Cat.new('Dorrie', 3)

# [nemo, fido, dorrie].each do |animal|
#   puts "#{animal.name}: #{animal.talk}"
# end


# What are collaborator objects and provide an example
# class Person
#   attr_accessor :pets
  
#   def initialize(name)
#     @name = name
#     @pets = []
#   end

#   def add_pet(new_pet)
#     pets << new_pet
#   end
# end

# module Swimmable
#   def swims
#     "I'm swimming!"
#   end
# end

# class Animal
#   attr_reader :name
  
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end

#   def sleep
#   end

#   def talk
#     'Talking'
#   end
# end

# class Cat < Animal
#   def purrs
#   end

#   def talk
#     'Purring'
#   end
# end

# class Dog < Animal
#   include Swimmable
  
#   def barks
#   end

#   def talk
#     'Barking'
#   end
# end

# class Fish < Animal
#   include Swimmable

#   def talk
#     'Silent communication'
#   end
# end

# nemo = Fish.new('Nemo', 1)
# fido = Dog.new('Fido', 2)
# dorrie = Cat.new('Dorrie', 3)

# bob = Person.new('Bob')
# bob.add_pet(nemo)
# p bob.pets
# p bob.pets[0].talk


# Explain why we would use getters and setters instead of 
# referencing the instance variable directly and provide
# an example
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name.split.map(&:capitalize).join(' ')
  end

  def display_welcome_message
    "Hello #{name}"
  end
end

bob = Person.new('bob')
p bob.name
p bob.display_welcome_message

